require 'spec_helper'

feature 'User visits meetups page and sees meetups displayed in alphabetical order' do
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
  scenario "meetup is visible" do
    meetup_one
    visit "/"

    expect(page).to have_content "A meetup"
  end

  scenario "meetup is in alphabetical order" do
    meetup_one
    meetup_two
    visit "/"

    first_meetup_position = page.body.index("A meetup")
    last_meetup_position = page.body.index("B meetup")
    expect(first_meetup_position).to be < last_meetup_position
  end

  scenario "each meetup should be a link to another page" do
    meetup_one
    visit "/"
    click_link("A meetup")

    expect(page).to have_content "Etc one"
  end
end
