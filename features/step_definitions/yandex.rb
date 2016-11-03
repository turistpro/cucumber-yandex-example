Given(/^I am on the Yandex homepage$/) do
    visit 'http://www.yandex.ru/'
end

When(/^I will search for "(.*?)"$/) do |searchText|
    # fill_in 'Запрос', :with => searchText
    find("input[aria-label='Запрос']").set(searchText)
    click_button('Найти', exact: true)
    page.save_screenshot 'screenshots/request.png'
    wait_for_ajax # This is new!
end

Then(/^I should see "(.*?)"$/) do |expectedText|
	expect(page).to have_content(expectedText)
end

Then(/^I save screenshot "([^"]*)"$/) do |filename|
	page.save_screenshot "screenshots/#{filename}.png"
end
