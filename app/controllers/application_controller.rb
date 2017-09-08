class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :logged_in?

  def logged_in?
    if not session['user']
      redirect_to login_path and return
    end
    @current_user = User.find_by_id(session['user'])
  end
end
