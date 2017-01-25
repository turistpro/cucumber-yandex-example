require 'capybara/cucumber'
require 'selenium/webdriver'
require 'capybara/poltergeist'

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

# Capybara.javascript_driver = :poltergeist
Capybara.default_driver = :poltergeist
Capybara.run_server = false


