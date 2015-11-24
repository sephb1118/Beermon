class User < ActiveRecord::Base
  has_many :beers, dependent: :destroy
  has_many :comments, through: :beers
  before_save { email.downcase! }
  #attr_accessible :name, :email, :password, :password_confirmation
  validates :name, presence: true, length: { maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255},
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: {case_sensitive: false}
  has_secure_password
  validates :password, presence: true, length: {minimum: 6}
end
