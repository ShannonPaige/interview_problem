require "./test/test_helper"
require 'pry'

class Api::V1::UsersControllerTest < ActionController::TestCase

  test "#index responds with all users" do
    get :index, format: :json
    res = JSON.parse(response.body)

    assert_response :success
    assert_equal "Edgar", res[0]["first_name"]
    assert_equal "Duran", res[0]["last_name"]
    assert_equal "ed@email.com", res[0]["email"]
    assert_equal "Mark", res[1]["first_name"]
    assert_equal "Miranda", res[1]["last_name"]
    assert_equal "mm@email.com", res[1]["email"]
  end

  test "#create responds with created user when params are valid" do
    params = {
      first_name: "shannon",
      last_name: "paige",
      email: "spaige@gmail.com",
      social_security_number: "123456789"
    }

    get :create, params, format: :json
    res = JSON.parse(response.body)

    assert_response :success
    assert_equal "shannon", res["first_name"]
    assert_equal "paige", res["last_name"]
    assert_equal "spaige@gmail.com", res["email"]
  end

  test "#create responds with error when first_name is missing" do
    params = {
      last_name: "paige",
      email: "spaige@gmail.com",
      social_security_number: "123456789"
    }

    get :create, params, format: :json
    res = JSON.parse(response.body)

    assert_response 400
    assert_equal "User can not be saved", res["error"]
  end

  test "#create responds with error when last_name is missing" do
    params = {
      first_name: "shannon",
      email: "spaige@gmail.com",
      social_security_number: "123456789"
    }

    get :create, params, format: :json
    res = JSON.parse(response.body)

    assert_response 400
    assert_equal "User can not be saved", res["error"]
  end

  test "#create responds with error when email is missing" do
    params = {
      first_name: "shannon",
      last_name: "paige",
      social_security_number: "123456789"
    }

    get :create, params, format: :json
    res = JSON.parse(response.body)

    assert_response 400
    assert_equal "User can not be saved", res["error"]
  end

  test "#create responds with error when social_security_number is missing" do
    params = {
      first_name: "shannon",
      last_name: "paige",
      email: "spaige@gmail.com"
    }

    get :create, params, format: :json
    res = JSON.parse(response.body)

    assert_response 400
    assert_equal "User can not be saved", res["error"]
  end

  test "#create responds with error when email is invalid" do
    params = {
      first_name: "shannon",
      last_name: "paige",
      email: "spaige.com",
      social_security_number: "123456789"
    }

    get :create, params, format: :json
    res = JSON.parse(response.body)

    assert_response 400
    assert_equal "User can not be saved", res["error"]
  end

  test "#create responds with error when social_security_number is too short" do
    params = {
      first_name: "shannon",
      last_name: "paige",
      email: "spaige@gmail.com",
      social_security_number: "123"
    }

    get :create, params, format: :json
    res = JSON.parse(response.body)

    assert_response 400
    assert_equal "User can not be saved", res["error"]
  end

  test "#create responds with error when social_security_number is too long" do
    params = {
      first_name: "shannon",
      last_name: "paige",
      email: "spaige@gmail.com",
      social_security_number: "1234567890"
    }

    get :create, params, format: :json
    res = JSON.parse(response.body)

    assert_response 400
    assert_equal "User can not be saved", res["error"]
  end

  test "#create responds with error when social_security_number is invalid" do
    params = {
      first_name: "shannon",
      last_name: "paige",
      email: "spaige@gmail.com",
      social_security_number: "socialsec"
    }

    get :create, params, format: :json
    res = JSON.parse(response.body)

    assert_response 400
    assert_equal "User can not be saved", res["error"]
  end

end
