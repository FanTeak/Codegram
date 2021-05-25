class ApplicationController < ActionController::Base
	include Pundit

	protect_from_forgery with: :exception
	before_action :configure_permitted_parameters, if: :devise_controller?

	rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

	def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :email, :password)}
    end

	private def user_not_authorized
		flash[:alert] = "You are not authorized to perform this action."
		redirect_to(request.referrer || root_path)
	end
end
