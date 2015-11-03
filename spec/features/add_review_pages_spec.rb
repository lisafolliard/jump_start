require 'rails_helper'

describe "add review to an image" do
  it "adds a review to an image on user page", js: true do
    login_user
    click_link 'Cat'
    click_link "Add Image"
    fill_in "Description", with: 'flower'
    page.attach_file("Image", 'spec/fixtures/images/flowers.jpg')
    click_on 'Save'
    click_link 'Add Review'
    fill_in 'Author', with: "Ben Marks"
    fill_in 'Review', with: "Good work"
    click_on 'Save'
    expect(page).to have_content "Good work"
  end

  def login_user
    visit root_path
    click_link "Sign up"
    fill_in "Email", with: "cat@cat.com"
    fill_in "Username", with: "Cat"
    fill_in "Password", with: "88888888"
    fill_in "Password confirmation", with: "88888888"
    click_on "Sign Up"
  end
end
