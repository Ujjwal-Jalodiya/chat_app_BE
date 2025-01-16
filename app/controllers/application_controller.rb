class ApplicationController < ActionController::API
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :current_user, unless: :devise_controller?

  def current_user
    if request.headers["Authorization"].present?
      jwt_payload = JWT.decode(request.headers["Authorization"], Rails.application.secret_key_base).first
      current_user = User.find_by(jti: jwt_payload["jti"])
      current_user
    end
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name avatar])
  end
end
