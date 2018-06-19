class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google
    common_callback
  end

  def twitter
    common_callback
  end

  def common_callback
    auth_info = request.env['omniauth.auth']
    auth = Auth.find_from_auth(auth_info)
    binding.pry

    if auth.present?
      # @user = User.find(@auth.user_id)
      @user = auth.user
    else
      if user_signed_in?
        @user = current_user
      else
        @user = User.new(email: "#{auth_info.uid}.#{auth_info.provider}@example.com",
                         password: Devise.friendly_token[0, 20])
        @user.skip_confirmation!
        @user.save
      end

      auth = Auth.create_from_auth(@user.id, auth_info)
    end

    sign_in_and_redirect @user, event: :authentication
    set_flash_message(:notice, :success, kind: auth.provider) if is_navigational_format?
  end

  def failue
    # code
  end
end
