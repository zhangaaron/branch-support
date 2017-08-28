class Reply < ActiveRecord::Base
  belongs_to :message

  default_scope { order(created_at: :asc)} # message thread should have latest reply last.

  validates :message_id, presence: true
  validates :body, presence: true
  validates :sender, presence: true

end
