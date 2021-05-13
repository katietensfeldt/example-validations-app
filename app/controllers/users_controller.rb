class UsersController < ApplicationController
  def index
    users = User.all
    render json: users.as_json
  end

  def create
    user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email]
    )
    if user.save
      render json: user.as_json
    else
      render json: {errors: user.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def show
    user = User.find(params[:id])
    render json: user.as_json
  end

  def update
    user = User.find(params[:id])
    user.first_name = params[:first_name] || user.first_name
    user.last_name = params[:last_name] || user.last_name
    user.email = params[:email] || user.email
    if user.save
      render json: user.as_json
    else
      render json: {errors: user.errors.full_messages}
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    render json: {message: "User successfully deleted"}
  end
end
