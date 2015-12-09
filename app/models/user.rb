class User < ActiveRecord::Base
  before_save { self.email = self.email.downcase }
  validates(:name, {presence:true})

  validates(:email, {presence:true})
  validates :name, length: {maximum:50}
  validates :email, length: {maximum:255}
  validates :email, uniqueness: true
  validates :email, uniqueness: { case_sensitive: false }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, format:{with: VALID_EMAIL_REGEX }


end
