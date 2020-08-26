class ApplicationController < ActionController::Base
  #protect_from_forgery with: :exception
  prepend_view_path Rails.root.join('app/javascript')

  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    #devise_parameter_sanitizer.permit(:sign_up) do |user_params|
    #  user_params.permit(:name, :email, :password)
    #end
  end
end
