class User < ActiveRecord::Base
  has_secure_password

  has_many :joins
  has_many :groups, through: :joins
  
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  before_save :downcase

  validates :first_name, :last_name, presence: true, length: { in: 2..20 }
  validates :password, :password_confirmation, length: { in: 8..18 }
  validates :email, presence: true, format: { with:EMAIL_REGEX }

  private
  	def downcase
  		self.email.downcase!
  	end
end
