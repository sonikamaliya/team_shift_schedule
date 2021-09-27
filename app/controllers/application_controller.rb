class ApplicationController < ActionController::Base
	# protect_from_forgery with: :exception

	before_action :configure_permitted_parameters, if: :devise_controller?

	def after_sign_in_path_for(user)
    if current_user
      teams_path
    else
      root_path
    end
  end

	protected

			def configure_permitted_parameters
					 devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :DOB, :mobile_number, :email, :password)}
			end
end
