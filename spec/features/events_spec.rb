require 'rails_helper'

feature "Events" do

  scenario "User edits an event" do
    Event.create!(
    description: "My aweeesome event"
    )

    visit root_path
    expect(page).to have_content("My aweeesome event")
    click_on "edit"
    fill_in "Description", with: "My awesome event"
    click_on "Update Event"

    expect(page).to have_content("My awesome event")
    expect(page).to have_no_content("My aweeesome event")
  end

  ## Listing many events
  ## Setup
  scenario 'listing events' do
    Event.create!(
    description: "free lunch today",

    )

    Event.create!(
    description: "Hug Momo Hour",

    )

    Event.create!(
    description: "Ramen festival",

    )

    ## Do the thing
    visit root_path

    ## Excercion

    expect(page).to have_content("Hug Momo Hour")
    expect(page).to have_content("free lunch today")
    expect(page).to have_content("Ramen festival")

  end

  scenario 'deleting events' do
    Event.create!(
    description: "Im going to be deleted"
    )
    visit root_path
    click_on "delete"

    expect(page).to have_no_content("Im going to be deleted")
    expect(page.current_path).to eq(events_path)
  end
end
