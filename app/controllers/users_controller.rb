class UsersController < ApplicationController
  before_action :set_user, :only [:show, :edit, :update, :destroy]
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def edit
  end

  def show
  end

  def create
    @user = User.new(user_params)
  end

  def update
  end

  def destroy
  end

  Private
  def user_params
    params.require(:user).permit(:name, :email, :password_digest)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
