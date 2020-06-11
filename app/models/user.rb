class User < ActiveRecord::Base 
  has_secure_password
  validates :email, presence: true  
  has_many :post_discussions
  validates :email, uniqueness: true
end