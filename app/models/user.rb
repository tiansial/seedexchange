class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  has_many :seeds

  acts_as_voter

  def self.from_omniauth(auth)
     where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
       user.provider = auth.provider
       user.uid = auth.uid
       user.name = auth.info.name
       user.email = auth.info.email
       user.location = auth.info.location
       user.photo = auth.info.image
       user.password = Devise.friendly_token[0,20]
     end
  end

  

  def online?
    # If key lifetime effused - that returns false, differently true
    if $redis_onlines.exists(self.id)
      "user-online"
    else
      "user-offline"
    end
  end

  

end
