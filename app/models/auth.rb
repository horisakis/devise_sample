class Auth < ApplicationRecord
  belongs_to :user

  # class methods
  def self.find_from_auth(auth)
    find_by(provider: auth[:provider], uid: auth[:uid])
  end

  def self.create_from_auth(user_id, auth)
    case auth[:provider].to_s
    when "google"
      create(user_id: user_id,
             provider: auth[:provider],
             uid: auth[:uid],
             token: auth[:credentials][:token],
             secret_token: auth[:credentials][:refresh_token],
             expires_at: Time.at(auth[:credentials][:expires_at]))

    when "twitter"
      create(user_id: user_id,
             provider: auth[:provider],
             uid: auth[:uid],
             token: auth[:credentials][:token],
             secret_token: auth[:credentials][:secret])

    end
  end
end
