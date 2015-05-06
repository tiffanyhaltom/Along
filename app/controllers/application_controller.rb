class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :set_user_location, :user_location, :remote_ip, :client

  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def remote_ip
    request.remote_ip == '127.0.0.1' ? '96.224.241.215' : request.remote_ip
  end

  def current_permission
    @current_permission ||= Permission.new(current_user)
  end

  def authorize
    if !current_permission.allow?(params[:controller], params[:action])
      flash[:danger] = "Sorry, you cant #{params[:action]} this user. Click this message to close it"
      redirect_to root_url
    end
  end
end
