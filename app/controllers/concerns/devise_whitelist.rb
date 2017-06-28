module DeviseWhitelist
  extend ActiveSupport::Concern

  included do
    before_action :configure_permitted_parameters, if: :devise_controller?
  end

  def configure_permitted_parameters
    # specific to Rails 5
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
end
  # helper-type code, made to be shared by different classes, tend to be "modules" rather than classes.

  # Convention AND the Rails parser dictate that filename should be snake-case, and module name should be PascalCase, including caps coresponding with gaps.
