# Overriding Devise Sessions to create and destroy them for login
class SessionsController < Devise::SessionsController
  skip_before_filter :verify_authenticity_token, only: [:create, :destroy]

  respond_to :json

  def create
    warden.authenticate!(scope: resource_name, recall: "#{controller_path}#failure")
    render json: { current_user: current_user, message: 'Welcome!' }, status: :ok
  end

  def destroy
    warden.authenticate!(scope: resource_name, recall: "#{controller_path}#failure")
    sign_out
    render json: { success: true, info: 'Logged out', csrfParam: request_forgery_protection_token, csrfToken: form_authenticity_token }, status: :ok
  end

  def failure
    render json: { success: false, error: 'Invalid username/password combination' }
  end
end
