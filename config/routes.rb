Rails.application.routes.draw do
  resources :orders do
    member do
      patch :update_status
    end
  end

  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
