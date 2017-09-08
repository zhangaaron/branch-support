class SessionsController < ApplicationController
  skip_before_filter :logged_in?
  def new

  end

  def create
    user = User.find_by_email(params[:session][:email])
    if user
      session['user'] = user.id
      flash[:notice] = "Logged in as: #{params[:session][:email]}"
      flash.keep
      redirect_to root_path
    else
      flash[:notice] = "Couldn't find a user with value: #{params[:session][:email]}"
      flash.keep
      redirect_to login_path
    end

  end

  def logout
    session.clear
    redirect_to login_path
  end
end
