require "./test/test_helper"
require 'pry'

class UsersControllerTest < ActionController::TestCase

  test "#index responds with success" do
    get :index
    assert_response :success
  end

  test "#show responds with success" do
    get :show, id: 1
    assert_response :success
  end
end
