require 'bcrypt'

class User

  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  property :id, Serial
  property :username, String, required: true, unique: true
  property :email, String, required: true, unique: true
  # property :football_team, String
  property :password_digest, Text

  validates_confirmation_of :password
  # validates_presence_of :email

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email, password)
    user = User.first(email: email)
    if user && BCrypt::Password.new(user.password_digest) == password  # is this equivalent to BCrypt::Password.new(password + user.salt) is equal to user.password_digest
      user
    else
      nil
    end
  end

end