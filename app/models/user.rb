class User < ActiveRecord::Base
  has_secure_password
  has_many :squaks

  validates_length_of :username, :within => 6..20, :too_long => "pick a shorter name", :too_short => "pick a longer name"

end
