require 'capybara/cucumber'
require 'selenium/webdriver'

capabilities = Selenium::WebDriver::Remote::Capabilities.new
capabilities['browserName'] = "chrome"
capabilities['version'] = ""
capabilities['platform'] = "LINUX"
# capabilities['video'] = "True"

Capybara.register_driver :selenium do |app|

# If the requested test environment is not registered with the selenium grid hub
# or busy, allow enough time for the Gridlastic auto scaling
# functionality to launch a node with the requested environment.
  client = Selenium::WebDriver::Remote::Http::Default.new
  client.timeout = 1200 #seconds
  
  Capybara::Selenium::Driver.new(app, http_client: client,
    :browser => :remote,
    :url => "http://hub:4444/wd/hub",
    :desired_capabilities => capabilities)
end

Capybara.default_driver = :selenium
Capybara.run_server = false

#TEST VIDEO
#VIDEO_URL set to like "https://s3-ap-southeast-2.amazonaws.com/b2729248-ak68-6948-a2y8-80e7479te16a/9ag7b09j-6a38-58w2-bb01-17qw724ce46t/play.html?".
#Find this VIDEO_URL value in your Gridlastic dashboard.
# session_id = Capybara.current_session.driver.browser.instance_variable_get(:@bridge).session_id
# STDOUT.puts "TEST VIDEO URL: "+VIDEO_URL+session_id

#Maximize window. 
# Capybara.current_session.driver.browser.manage.window.maximize
# On LINUX/FIREFOX the "manage.window.maximize" option above does not expand browser window to max screen size. Resize as below:
window = Capybara.current_session.driver.browser.manage.window
window.resize_to(1280,1024) # width, height

