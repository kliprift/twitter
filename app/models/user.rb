class User < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
  attr_accessor :password_confirmation
  EMAIL_REGEX = /[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}/i
  validates :name, presence: true
  validates :email, :presence => true, uniqueness: {case_sensitive: false, message: " was used before"}, :format => EMAIL_REGEX
  validates :password, :confirmation => true 
  has_many :tweets, dependent: :destroy 
  has_many :followers 
  
  has_secure_password
 
end
