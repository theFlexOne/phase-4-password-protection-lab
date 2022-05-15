class UsersController < ApplicationController
  def create
    user = User.create!(user_params)
    session[:user_id] = user.id
    render json: user, status: :created
  rescue
    render json: { error: "Invalid username or password" }, status: :unprocessable_entity
  end

  private

  def user_params
    params.permit :username, :password
  end
end
