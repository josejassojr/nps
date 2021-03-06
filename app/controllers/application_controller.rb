class ApplicationController < ActionController::Base
  impersonates :user
  # DEPRECATION WARNING: 'include Pundit' is deprecated. Please use 'include Pundit::Authorization' instead.
  include Pundit::Authorization

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :avatar])
    end
end
