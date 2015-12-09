require 'spec_helper'

feature 'User visits meetups page and sees usernames and avatar urls displayed' do
  let(:meetup_one) do
    Meetup.create(
      name: "A meetup",
      description: "Etc one",
      location: "One park ave.",
      creator: "John"
    )
  end
  let(:meetup_two) do
    Meetup.create(
      name: "B meetup",
      description: "Etc two",
      location: "Two park ave.",
      creator: "Nick"
    )
  end
  let(:user) do
    User.create(
      provider: "RickyINC",
      uid: "Notorious R.I.C.K",
      username: "Ricky",
      email: "RickyBobby@hotmail.biz",
      avatar_url: "www.rickypicks.com/wtfricky"
    )
  end
  let(:membership) do
    Membership.create(
    user_id: user.id,
    meetup_id: meetup_one.id
    )
  end

  scenario "user is visible" do
    meetup_one
    user
    membership
    visit "/"
    click_link "A meetup"

    expect(page).to have_content "Ricky"
    expect(page).to have_content "www.rickypicks.com/wtfricky"
  end

end
