require "test_helper"

class UserTest < ActiveSupport::TestCase
  
  test "should be able to create an email and password" do
    user = User.create(email: "mail@mail.com", password: "password123")
    assert user.valid?, "Invalid User"
  end
end
