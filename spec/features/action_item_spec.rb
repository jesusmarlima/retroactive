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

feature "In order to get the action item actioned" do
  scenario "Vanessa assigns items to a team member" do
    Given 'An action item is created'
    When 'I view the action items'
    And 'I click on edit on the first action item'
    Then 'I enter Vanessa Sant Anna as the owner for the item'
    And 'I click on update'
    Then 'I see the items list'
    And  'I see Vanessa Sant Anna is the owner of the first item'
  end

  def an_action_item_is_created
    @action_item = FactoryGirl.create(:action_item)
  end

  def i_view_the_action_items
    visit root_path
    expect(page).to have_content @action_item.action
  end

  def i_click_on_edit_on_the_first_action_item
   within ".action-items .action-item:nth-child(1)" do
     click_on "edit"
    end
  end

  def i_enter_vanessa_sant_anna_as_the_owner_for_the_item
    fill_in 'Owner', with: 'Vanessa Sant Anna'
  end

  def i_click_on_update
    click_on 'Update Action item'
  end

  def i_see_the_items_list
    expect(page).to have_content @action_item.action
  end

  def i_see_vanessa_sant_anna_is_the_owner_of_the_first_item
    within ".action-items .action-item:nth-child(1)" do
      expect(page).to have_content 'Vanessa Sant Anna'
    end
  end
end
