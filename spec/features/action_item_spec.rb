require 'spec_helper'

# feature 'Tracking action items'do
feature 'In order to remember the action items for the week'do

  scenario 'Vanessa records and views action items' do
    When 'Vanessa enters and saves some action items'
    Then 'she sees the action items on the main page'
  end

  def vanessa_enters_and_saves_some_action_items
    visit root_path
    @first_action_item = 'Do all the things'
    @second_action_item = 'Remind someone else to do all the things'
    add_action_item @first_action_item
    add_action_item @second_action_item
  end

  def she_sees_the_action_items_on_the_main_page
    visit root_path
    expect(page).to have_content @first_action_item
    expect(page).to have_content @second_action_item
  end

  def add_action_item item
    click_on 'Add Action Item'
    fill_in 'Action', with: item
    click_on 'Create Action item'
  end
end
