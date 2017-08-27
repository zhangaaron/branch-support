class Message < ActiveRecord::Base
  has_many :replies

  scope :not_resolved, -> {where(resolved: false)}
  scope :order_by_priority, -> {order(priority: :asc)}
  scope :order_by_most_recent, -> {order(created_at: :desc )}
end
