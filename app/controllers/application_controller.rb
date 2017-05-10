class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

    def authenticate_admin!
      authenticate_or_request_with_http_basic do |username, password|
        is_username_correct = username == HomePage.admin_credentials['username']
        is_password_corrent = password == HomePage.admin_credentials['password']
        is_username_correct && is_password_corrent
      end
    end

    def admin_logged_in?
      not request.authorization.nil?
    end
    helper_method :admin_logged_in?
end
