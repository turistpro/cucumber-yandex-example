Feature: Yandex search

Scenario: Search for webdriver        
	Given I am on the Yandex homepage
	Then I save screenshot "homepage"
	When I will search for "agile"
	Then I save screenshot "results"
	Then I should see "agile"
