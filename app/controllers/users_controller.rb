# Users Controllers overidding Devise create user methods
class UsersController < Devise::RegistrationsController
  skip_before_filter :verify_authenticity_token, only: [:create]
  rescue_from Exception, with: :generic_exception

  def create
    @user = User.create(user_params)
    if @user.valid?
      sign_in(@user)
      respond_with @user, '/'
    else
      respond_with generic_exception('Invalid Credentials'), '/'
    end
  end

  private

  def generic_exception(error)
    respond_to do |format|
      format.json { render json: { error: error.message }, status: 500 }
    end
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
