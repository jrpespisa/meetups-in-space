# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Example:
#
#   Person.create(first_name: 'Eric', last_name: 'Kelly')
require 'faker'
users_attributes = [
  {provider: Faker::Internet.url('example.com'), uid: Faker::Number.number(4), username: Faker::Name.name, email: Faker::Internet.email, avatar_url: Faker::Internet.domain_name},
  {provider: Faker::Internet.url('example.com'), uid: Faker::Number.number(4), username: Faker::Name.name, email: Faker::Internet.email, avatar_url: Faker::Internet.domain_name},
  {provider: Faker::Internet.url('example.com'), uid: Faker::Number.number(4), username: Faker::Name.name, email: Faker::Internet.email, avatar_url: Faker::Internet.domain_name},
  {provider: Faker::Internet.url('example.com'), uid: Faker::Number.number(4), username: Faker::Name.name, email: Faker::Internet.email, avatar_url: Faker::Internet.domain_name},
  {provider: Faker::Internet.url('example.com'), uid: Faker::Number.number(4), username: Faker::Name.name, email: Faker::Internet.email, avatar_url: Faker::Internet.domain_name},
  {provider: Faker::Internet.url('example.com'), uid: Faker::Number.number(4), username: Faker::Name.name, email: Faker::Internet.email, avatar_url: Faker::Internet.domain_name},
  {provider: Faker::Internet.url('example.com'), uid: Faker::Number.number(4), username: Faker::Name.name, email: Faker::Internet.email, avatar_url: Faker::Internet.domain_name},
  {provider: Faker::Internet.url('example.com'), uid: Faker::Number.number(4), username: Faker::Name.name, email: Faker::Internet.email, avatar_url: Faker::Internet.domain_name},
  {provider: Faker::Internet.url('example.com'), uid: Faker::Number.number(4), username: Faker::Name.name, email: Faker::Internet.email, avatar_url: Faker::Internet.domain_name},
  {provider: Faker::Internet.url('example.com'), uid: Faker::Number.number(4), username: Faker::Name.name, email: Faker::Internet.email, avatar_url: Faker::Internet.domain_name},
  {provider: Faker::Internet.url('example.com'), uid: Faker::Number.number(4), username: Faker::Name.name, email: Faker::Internet.email, avatar_url: Faker::Internet.domain_name},
  {provider: Faker::Internet.url('example.com'), uid: Faker::Number.number(4), username: Faker::Name.name, email: Faker::Internet.email, avatar_url: Faker::Internet.domain_name},
  {provider: Faker::Internet.url('example.com'), uid: Faker::Number.number(4), username: Faker::Name.name, email: Faker::Internet.email, avatar_url: Faker::Internet.domain_name},
  {provider: Faker::Internet.url('example.com'), uid: Faker::Number.number(4), username: Faker::Name.name, email: Faker::Internet.email, avatar_url: Faker::Internet.domain_name},
  {provider: Faker::Internet.url('example.com'), uid: Faker::Number.number(4), username: Faker::Name.name, email: Faker::Internet.email, avatar_url: Faker::Internet.domain_name}
]
users_attributes.each do |attributes|
  User.create(attributes)
end

meetups_attributes = [
  {name: Faker::Company.name, description: Faker::Company.buzzword, location: Faker::Address.street_address, creator: Faker::Name.name},
  {name: Faker::Company.name, description: Faker::Company.buzzword, location: Faker::Address.street_address, creator: Faker::Name.name},
  {name: Faker::Company.name, description: Faker::Company.buzzword, location: Faker::Address.street_address, creator: Faker::Name.name},
  {name: Faker::Company.name, description: Faker::Company.buzzword, location: Faker::Address.street_address, creator: Faker::Name.name},
  {name: Faker::Company.name, description: Faker::Company.buzzword, location: Faker::Address.street_address, creator: Faker::Name.name}
]

meetups_attributes.each do |attributes|
  Meetup.create(attributes)
end

memberships_attributes = [
  {meetup_id: "1", user_id: "2"},
  {meetup_id: "1", user_id: "3"},
  {meetup_id: "1", user_id: "4"},
  {meetup_id: "1", user_id: "5"},
  {meetup_id: "2", user_id: "3"},
  {meetup_id: "2", user_id: "7"},
  {meetup_id: "2", user_id: "2"},
  {meetup_id: "2", user_id: "4"},
  {meetup_id: "3", user_id: "2"},
  {meetup_id: "3", user_id: "9"},
  {meetup_id: "4", user_id: "10"},
  {meetup_id: "4", user_id: "9"},
  {meetup_id: "4", user_id: "2"},
  {meetup_id: "4", user_id: "3"},
  {meetup_id: "4", user_id: "4"},
  {meetup_id: "5", user_id: "5"},
  {meetup_id: "5", user_id: "4"},
  {meetup_id: "5", user_id: "10"},
  {meetup_id: "5", user_id: "9"},
  {meetup_id: "5", user_id: "1"},
  {meetup_id: "5", user_id: "3"},
  {meetup_id: "5", user_id: "6"}

]

memberships_attributes.each do |attributes|
  Membership.create(attributes)
end
