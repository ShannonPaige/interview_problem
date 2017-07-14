require 'test_helper'

class UserTest < ActiveSupport::TestCase
context "validations" do
   should validate_presence_of(:first_name)
   should validate_presence_of(:last_name)
   should validate_presence_of(:email)
   should allow_value("user@example.com").for(:email)
   should_not allow_value("not-an-email").for(:email)
   should validate_presence_of(:social_security_number)
   should allow_value("123456789").for(:social_security_number)
   should_not allow_value("123").for(:social_security_number)
 end
end
