class UsersController < ApplicationController

  def index
    @user = User.all
  end

  def show
    @user = User.find_by_id(params[:id])
  end

  def new
    @user = User.new
  end

  def logout
    session[:user_id] = nil
    redirect_to '/'
  end

  def create
    user = User.find_or_create_by(user_params)
    session[:user_id] = user.id
    redirect_to '/'
  end

  def edit
    @user = User.find_by_id(params[:id])
  end

  def update
    @user = User.find_by_id(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def destroy
    session[:user_id] = nil
    user = User.find_by_id(params[:id])
	  user.destroy
	  redirect_to '/'
  end

  private

  def user_params
    params.require(:user).permit(:id, :username, :password, :email)
  end
end
