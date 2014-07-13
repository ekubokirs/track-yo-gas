class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :navigation_type

  def navigation_type
    if current_user
      @nav = "shared/in_nav"
      @user = current_user
    else
      @nav = "shared/out_nav"
    end
  end
end
