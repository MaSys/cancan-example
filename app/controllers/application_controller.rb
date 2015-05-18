class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: exception.message
  end

  helper_method :current_user

  private

  def current_ability
    @current_ability ||= Ability.new(current_user)
  end
  
  def current_user
    @current_user ||= User.find(2)
  end
end