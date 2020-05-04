class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:user_image,:user_name,:love_brand,:year_birth_at ,:month_birth_at,:day_birth_at,:gender,:height,:user_type ])
  end
end
