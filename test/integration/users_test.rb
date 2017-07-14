require "test_helper"

class UsersTest < ActionDispatch::IntegrationTest
  test "/users page shows all users" do
    visit '/users'

    assert_equal '/users', current_path
    assert page.has_content?("2 Users")
    assert page.has_content?("Edgar")
    assert page.has_content?("Duran")
    assert page.has_content?("ed@email.com")
    assert page.has_content?("Mark")
    assert page.has_content?("Miranda")
    assert page.has_content?("mm@email.com")
  end

  test "/users page shows user 1" do
    visit '/users/1'

    assert_equal '/users/1', current_path
    assert page.has_content?("Edgar")
    assert page.has_content?("Duran")
    assert page.has_content?("ed@email.com")
  end

end
