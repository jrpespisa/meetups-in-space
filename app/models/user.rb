class User < ActiveRecord::Base
  validates :username, uniqueness: true
  validates :username, presence: true
  validates :provider, presence: true
  validates :provider, uniqueness: true
  validates :uid, presence: true
  validates :uid, uniqueness: true
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :avatar_url, presence: true

  has_many :memberships
  has_many :meetups,
    through: :memberships
  def self.find_or_create_from_omniauth(auth)
    provider = auth.provider
    uid = auth.uid

    find_or_create_by(provider: provider, uid: uid) do |user|
      user.provider = provider
      user.uid = uid
      user.email = auth.info.email
      user.username = auth.info.name
      user.avatar_url = auth.info.image
    end
  end
end
