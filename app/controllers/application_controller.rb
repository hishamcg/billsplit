class ApplicationController < ActionController::Base
  protect_from_forgery
  # before_filter :authenticate_user!
  def after_sign_in_path_for(resource_or_scope)
    index_url
  end

end
