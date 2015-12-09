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
  scenario "successful meetup post" do
    visit '/'
    sign_in_as user
    expect(page).to have_content "You're now signed in as #{user.username}!"

    click_on("Add Meetup")
    expect(page).to have_content "Please enter meetup information below:"
  end

  scenario "unsuccessful creation if user is not signed in" do
    visit '/'
    click_on("Add Meetup")

    expect(page).to have_content "You need to sign in first!"
  end

  scenario "user successfully creates new meetup" do
    sign_in_as user
    visit '/meetups/new'
    fill_in 'Name:', with: 'A meetup'
    fill_in 'Description:', with: 'Sample of text strings etc.'
    fill_in 'Location:', with: 'somewhere'
    click_on 'Create'

    expect(page).to have_content "Attendees"
    expect(page).to have_content "Sample of text strings etc."
  end
end
