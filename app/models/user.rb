class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :omniauthable, omniauth_providers: %i[google twitter]

  has_many :auths, dependent: :destroy


  def self.find_or_create_from_twitter(auth)
    provider = auth[:provider]
    uid = auth[:uid]
    name = auth[:info][:nickname]
    image_url = auth[:info][:image]
    token = auth[:credentials][:token]
    secret = auth[:credentials][:secret]

    user = find_or_create_by(provider: provider, uid: uid) do |u|
      u.name = name
      u.token = token
      u.secret_token = secret
    end

    if user.tw_token != token || user.tw_token_secret != secret
      user.update(tw_token: token, tw_token_secret: secret)
    end

    user
  end

  # instance methods

end
