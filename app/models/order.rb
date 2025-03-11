class Order < ApplicationRecord
  enum :status, { pending: 0, progress: 1, complete: 2 }

  validates :status, presence: true
end
