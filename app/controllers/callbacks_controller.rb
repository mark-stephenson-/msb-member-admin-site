class CallbacksController < Devise::OmniauthCallbacksController
  def facebook
    @user = User.from_omniauth(request.env["omniauth.auth"])
    CreateManagedPages.new(@user).call
    sign_in_and_redirect @user
  end
end
