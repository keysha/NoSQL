# Technologie NoSQL

* Skrypt crunchbase_data.rb pobiera dane ze strony http://www.crunchbase.com/api oraz zapisuje je do bazy danych mongodb o nazwie "zaliczenie".
* Skrypt couch_mongo.rb pobiera dane z mongo i wrzuca je do couch db.

# Działanie
Jako argument pierwszy przyjmuje namespace, takie jak:

company
person
financial-organization
product
service-provider

Oraz jako drugi argument przyjmuje permalink, czyli przykładowe użycie:

	ruby crunchbase_data.rb company facebook

TODO: 
	* pobranie wiekszej ilosci danych
	* export danych do innej bazy NoSQL

![alt text](http://i.imgur.com/WWLYo.gif "Frustrated cat can't believe this is the 12th time he's clicked on an auto-linked README.md URL")
