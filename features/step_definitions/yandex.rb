Given(/^Я на главной странице Яндекса$/) do
    visit 'http://www.yandex.ru/'
    step 'Сохранить скриншот "homepage"'
end

When(/^Я введу в поиске "(.*?)"$/) do |searchText|
    # fill_in 'Запрос', :with => searchText
    find("input[aria-label='Запрос']").set(searchText)
    step 'Сохранить скриншот "request"'
    click_button('Найти', exact: true)
    wait_for_ajax # This is new!
end

Then(/^Я увижу "(.*?)"$/) do |expectedText|
    expect(page).to have_content(expectedText)
    step 'Сохранить скриншот "results"'
end

Then(/^Сохранить скриншот "([^"]*)"$/) do |filename|
	# page.save_screenshot "screenshots/#{filename}.png"
        img64 = Capybara.current_session.driver.browser.screenshot_as(:base64) 
        embed(img64, 'image/png')
        # embed("screenshots/#{filename}.png", 'image/png')
end
