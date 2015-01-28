class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :urls
  validates :full_name, :email, :password, presence: true

  def self.authenticate(email, password)
    # self.find_by(email:email, password:password)
    self.where("email = ? AND password = ?", email, password).first
    # if email and password correspond to a valid user, return that user
    # otherwise, return nil
  end
end