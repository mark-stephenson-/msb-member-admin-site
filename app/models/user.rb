class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  has_many :managed_pages

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider         = auth.provider
      user.uid              = auth.uid
      user.email            = auth.info.email
      user.password         = Devise.friendly_token[0, 20]
      user.fb_token         = auth.credentials.token
      user.fb_token_expires = auth.credentials.expires
      user.full_name        = auth.info.name
      user.fb_profile_image = auth.info.image
    end
  end
end
