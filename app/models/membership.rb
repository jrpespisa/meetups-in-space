class Membership < ActiveRecord::Base
  validates :meetup, presence: true
  validates :user, presence: true

  belongs_to :meetup
  belongs_to :user
end
