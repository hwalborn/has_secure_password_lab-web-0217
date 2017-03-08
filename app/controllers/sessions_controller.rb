class SessionsController < ApplicationController
  def create
    @user = User.find_by(name: params[:user][:name])
    if @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to homepage_path
    else
      flash[:error] = "Bad password or username"
      redirect_to new_user_path
    end
  end
end
