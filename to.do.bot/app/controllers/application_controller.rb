class ApplicationController < ActionController::Base
  helper_method :chatgpt?
  before_action :set_response_format
  protect_from_forgery unless: :chatgpt?

  rescue_from StandardError, with: :render_error_response
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response


  def render_error_response(error)
    render json: { error: error.message }, status: :internal_server_error
  end

  def render_not_found_response(error)
    render json: { error: error.message }, status: :not_found
  end

  def set_response_format
    return unless chatgpt?

    request.format = :json if request.format.html?
  end

  def chatgpt?
    request.user_agent.include? "ChatGPT-User"
  end
  protected

  def after_sign_up_path_for(resource)
    '/welcome'
  end

end
