class ApplicationController < ActionController::Base

  before_action :authenticate_user!
  load_and_authorize_resource

  protect_from_forgery with: :exception

  # rescue_from CanCan::AccessDenied do |exception|
  #   redirect_to root_path, :alert => exception.message
  # end

  # rescue_from CanCan::AccessDenied do |exception|
  #     respond_to do |format|
  #       format.json { head :forbidden, content_type: 'text/html' }
  #       format.html { redirect_to main_app.root_url, notice: exception.message }
  #       format.js   { head :forbidden, content_type: 'text/html' }
  #     end
  #   end

end
