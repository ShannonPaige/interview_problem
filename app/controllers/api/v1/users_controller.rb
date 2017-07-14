class Api::V1::UsersController < ApplicationController
  respond_to :json

  def index
    respond_with User.all
  end

  def create
    user = User.new(user_params)
    if user.save
      render :json => user
    else
      render :json => {error: "User can not be saved"}, status: 400
    end
  end

  private

    def user_params
      params.permit(:first_name, :last_name, :email, :social_security_number)
    end
end
