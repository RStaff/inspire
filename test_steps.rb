Given /^I am on the Home page$/ do
    @inspire_page = Pages::InspirePage.new
    @inspire_page.visit_page
end

When /^I log into my account$/ do
    @inspire_page.login
    @inspire_page.fill_out_login
    expect(@inspire_page).to have_content("RossTest")
end

Then /^I click on "Start a Post"$/ do
    @inspire_page.click_modal('.btn-newpost-big')
end

Then /^an overlay should open$/ do
    expect(@inspire_page).to have_content("Post an Entry in My Journal")
end

When /^I select "Post an Entry in My Journal"$/ do
    @inspire_page.click_href('#journal')
end

When /^I create a title in the “Title” input field.$/ do
    @inspire_page.fill_in_title("Test Title")
end

And /^I create a body in the input body field$/ do
    @inspire_page.fill_in_body("This is a test post.")
end

And /^I choose  "Select None" under "Post in these communities"$/ do
    @inspire_page.click_modal('#groups_none')
end

And(/^I choose "([^"]*)" from the dropdown menu$/) do |arg1|
    @inspire_page.click_modal('#privacy_chosen')
    @inspire_page.click_dropdown(arg1)
end

And /^I click the post button$/ do
    @inspire_page.click_modal('#post-submit')
end

Then /^I should receive an error without captcha disabled$/ do
    expect(@inspire_page).to have_content("Please help prevent spam by completing the reCAPTCHA.")
end

Then /^my post should be visible$/ do
    expect(@inspire_page).to have_current_path("https://www.inspire.com/RossTest/journal/list/")
    expect(@inspire_page).to have_content("Test Title")
end
