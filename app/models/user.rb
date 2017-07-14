class User < ActiveRecord::Base
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :email
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
  validates_presence_of :social_security_number
  validates_length_of :social_security_number, :is => 9
  validates_format_of :social_security_number, :with => /\d{9}/, :on => :create
end
