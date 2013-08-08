class User < ActiveRecord::Base
  # this is where we need user authentication stuff
  include BCrypt


  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.log_up_new_user(params)
    User.create(params)
  end
end
