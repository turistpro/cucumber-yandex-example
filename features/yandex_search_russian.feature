# language: ru
Функционал: Поиск в Яндексе

Сценарий: Search for agile     
	Дано  I am on the Yandex homepage
	Если  I save screenshot "homepage"
	Если  I will search for "mosvolt"
	Тогда I save screenshot "results"
	И     I should see "mosvolt"

