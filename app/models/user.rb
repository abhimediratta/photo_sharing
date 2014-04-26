class User < ActiveRecord::Base
  has_many :photos,dependent: :destroy
  has_one :shared_album,dependent: :destroy
  attr_accessible :email, :name, :password,:password_confirmation
  has_secure_password

  validates :name, presence: true, length: { maximum: 30 }
  validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i },
                    uniqueness: { case_sensitive: false }
  
  validates :password, presence: true, length: { minimum: 8 }
  validates :password_confirmation, presence: true
  

  before_create :create_remember_token

  def create_remember_token
  	self.remember_token = SecureRandom.urlsafe_base64
  end

end
