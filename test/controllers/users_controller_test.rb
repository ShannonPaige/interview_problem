require "./test/test_helper"
require 'pry'

class UsersControllerTest < ActionController::TestCase

  test "#index responds with a list of all users" do
    get :index
    assert_response :success
  end
end
