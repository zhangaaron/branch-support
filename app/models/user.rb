class User < ActiveRecord::Base
  has_many :replies
  validates :email, uniqueness: true
  validates :name, presence: true
  validates :email, presence:true

end
