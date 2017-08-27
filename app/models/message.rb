class Message < ActiveRecord::Base
  has_many :replies

  scope :not_resolved, -> {where(resolved: false)}
  scope :order_by_priority, -> {order(priority: :asc)}
  scope :order_by_most_recent, -> {order(created_at: :desc )}

  validates :body, presence: true
  validates :sender, presence: true
  validates :resolved, presence: true
  validates :priority, numericality: {greater_than: 0, less_than_or_equal_to: 5}
end
