class ApplicationController < ActionController::Base
  before_action :require_login
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
  	@current_user ||=User.find_by(id: session[:user_id]) if session.key? 'user_id'
  end
  helper_method :current_user

  def require_login
  	redirect_to new_login_path unless session.key? 'user_id'
  end
end
