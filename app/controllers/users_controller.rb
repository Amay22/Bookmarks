# Users Controllers overriding Devise create user methods
class UsersController < Devise::RegistrationsController
  skip_before_filter :verify_authenticity_token, only: [:create]

  def create
    @user = User.create(user_params)
    if @user.valid?
      sign_in @user
      respond_to do |format|
        format.html { render nothing: true, layout: false }
        format.json { render json: @user }
      end
    else
      respond_to do |format|
        format.json { render json: 'User Creds Invalid', status: :unprocessable_entity }
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
