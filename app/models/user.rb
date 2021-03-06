require 'bcrypt'

class User < ActiveRecord::Base

  validates :username, uniqueness: true, presence: true
  validates :email, presence: true

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def authenticate?(input_password)
    self.password == input_password
  end
end

