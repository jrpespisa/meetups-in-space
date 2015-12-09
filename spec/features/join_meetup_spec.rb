require 'spec_helper'
require 'pry'

feature "User signs in" do
  let(:user) do
    User.create(
      provider: "github",
      uid: "1",
      username: "jarlax1",
      email: "jarlax1@launchacademy.com",
      avatar_url: "https://avatars2.githubusercontent.com/u/174825?v=3&s=400"
    )
  end
  let(:membership) do
    Membership.create(
    user_id: user.id,
    meetup_id: meetup_one.id
    )
  end
  let(:meetup_one) do
    Meetup.create(
      name: "A meetup",
      description: "Etc one",
      location: "One park ave.",
      creator: "John"
    )
  end

  scenario "user visits meetup page not a member of" do
    sign_in_as user
    meetup_one
    visit "/meetups/#{meetup_one.id}"
    click_on "Join!"

    expect(page).to have_content "You have joined the meetup!"
    expect(page).to have_content "https://avatars2.githubusercontent.com/u/174825?v=3&s=400"
  end

  scenario "user visits meetup page that is member of" do
    meetup_one
    sign_in_as user
    membership
    visit "/meetups/#{meetup_one.id}"

    expect(page).not_to have_content "Join!"
  end
  scenario "user visits meetup page not a member of" do
    meetup_one
    visit "/meetups/#{meetup_one.id}"
    click_on "Join!"

    expect(page).to have_content "You need to sign in first!"
  end
end
