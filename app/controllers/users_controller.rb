class UsersController < ApplicationController
  def homepage
    @user = User.find(session[:user_id])
  end

  def create
    if params[:user][:password] == params[:user][:password_confirmation]
      @user = User.create(user_params)
      session[:user_id] = @user.id
      redirect_to homepage_path
    else
      flash[:alert] = "Passwords did not match"
      redirect_to new_user_path
    end
  end

  def new
    @user = User.new
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
