class User < ActiveRecord::Base
  # before_save { self.email = self.email.downcase }
  before_save {email.downcase!}
  validates(:name, {presence:true})

  validates(:email, {presence:true})
  validates :name, length: {maximum:50}
  validates :email, length: {maximum:255}
  validates :email, uniqueness: { case_sensitive: false }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, format:{with: VALID_EMAIL_REGEX }

  has_secure_password
  validates :password, length: {minimum:6}
  validates :password_confirmation, length: {minimum:6}
  validates :password, {presence:true}
  validates :password_confirmation, {presence:true}
end
