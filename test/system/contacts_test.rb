require "application_system_test_case"

class ContactsTest < ApplicationSystemTestCase
  setup do
    @contact = contacts(:one)
  end

  test "visiting the index" do
    visit contacts_url
    assert_selector "h1", text: "Contacts"
  end

  test "should create contact" do
    visit contacts_url
    click_on "New contact"

    fill_in "Address", with: @contact.address
    fill_in "Company", with: @contact.company
    fill_in "First name", with: @contact.first_name
    fill_in "Last name", with: @contact.last_name
    fill_in "Latitude", with: @contact.latitude
    fill_in "Longitude", with: @contact.longitude
    fill_in "Main email", with: @contact.main_email
    fill_in "Main phone", with: @contact.main_phone
    fill_in "User", with: @contact.user_id
    click_on "Create Contact"

    assert_text "Contact was successfully created"
    click_on "Back"
  end

  test "should update Contact" do
    visit contact_url(@contact)
    click_on "Edit this contact", match: :first

    fill_in "Address", with: @contact.address
    fill_in "Company", with: @contact.company
    fill_in "First name", with: @contact.first_name
    fill_in "Last name", with: @contact.last_name
    fill_in "Latitude", with: @contact.latitude
    fill_in "Longitude", with: @contact.longitude
    fill_in "Main email", with: @contact.main_email
    fill_in "Main phone", with: @contact.main_phone
    fill_in "User", with: @contact.user_id
    click_on "Update Contact"

    assert_text "Contact was successfully updated"
    click_on "Back"
  end

  test "should destroy Contact" do
    visit contact_url(@contact)
    click_on "Destroy this contact", match: :first

    assert_text "Contact was successfully destroyed"
  end
end
