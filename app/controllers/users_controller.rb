class UsersController < ApplicationController

  before_action :set_user, only: [:show, :update, :destroy, :change_status]
  before_action :authenticate_user!, only: [:me]

  def index
    users = User.all
    render json: users.to_json(only: [:email, :auth_token])
  end

  def show
    render json: @user
  end

=begin
  def update
    authorize User
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end
=end

  def me
    render json: current_user
  end

  def change_status
    authorize @user
    render json: {}, status: :ok
  end

private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.fetch(:user).permit(:email)
  end

end
