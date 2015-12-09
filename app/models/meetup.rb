class Meetup < ActiveRecord::Base
  validates :name, uniqueness: true
  validates :name, presence: true
  validates :description, presence: true
  validates :location, presence: true
  validates :creator, presence: true

  has_many :memberships
  has_many :users,
    through: :memberships
end
