class UsersController < ApplicationController
  before_action :logged_in_user, only: [:followings, :followers]
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
    unless logged_in?
      redirect_to login_path
    else
      @user = User.find(params[:id])
    end
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user, notice: 'ユーザー情報を編集しました。'
    else
      render 'edit'
    end
  end
  
  def followings
    @followings = current_user.following_users
  end
  
  def followers
  end
  
  private
  def set_user
    @user = User.find(params[:id])
  end
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
end
