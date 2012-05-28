# Technologie NoSQL

Skrypt pobiera dane ze strony http://www.crunchbase.com/api oraz zapisuje je do bazy danych mongodb o nazwie "zaliczenie".

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
