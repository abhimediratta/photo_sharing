class User < ActiveRecord::Base
  
  attr_accessible :email, :name, :password,:password_confirmation
  has_secure_password

  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  validates :password, presence: true, length: { minimum: 8 }
  validates :password_confirmation, presence: true
  validates_confirmation_of :password

  before_create :create_remember_token

  def create_remember_token
  	self.remember_token = SecureRandom.urlsafe_base64
  end

end
