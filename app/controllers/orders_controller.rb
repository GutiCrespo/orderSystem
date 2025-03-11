class OrdersController < ApplicationController
  before_action :set_order, only: %i[ update_status ]

  # GET /orders or /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # POST /orders or /orders.json
  def create
    @order = Order.new

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: "Order was successfully created." }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH /orders/:id/update_status
  def update_status
    case @order.status
    when "pending"
      @order.update(status: "progress")
    when "progress"
      @order.update(status: "complete")
    end

    respond_to do |format|
      format.html { redirect_to orders_path, notice: "Status updated!" }
      format.turbo_stream
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:status)
    end
end
