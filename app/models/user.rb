class User < ApplicationRecord
  has_secure_password
  has_many :blogs

  def authenticate(password)
    BCrypt::Password.new(password_digest).is_password?(password)
  end
end
