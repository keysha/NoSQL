# Technologie NoSQL

* Skrypt crunchbase_data.rb pobiera dane ze strony http://www.crunchbase.com/api oraz zapisuje je do bazy danych mongodb o nazwie "zaliczenie".
* Skrypt couch_mongo.rb pobiera dane z mongo i wrzuca je do couch db.

# Działanie
Program crunchbase_data.rb Jako argument pierwszy przyjmuje plural_namespace, takie jak:

* companies 
* people 
* financial-organizations 
* products 
* service-providers

Jako drugi argument przyjmuje namespace, takie jak:

* company
* erson
* financial-organization
* product
* service-provider

Jako trzeci argument opcjonalnie przyjmuje ilość dokumentów, w przypadku nie podania liczby (lub podania cyfry 0) pobiera wszystkie.

Program couch_mongo.rb przyjmuje jako argument nazwe kolecji do pobrania, czyli wymienione wcześniej plural_namespace

# Przykład użycia:
	ruby ./crunchbase_data.rb companies company 10
	ruby elastic_mongo.rb companies



![alt text](http://images.inquisitr.com/wp-content/2010/02/catgif11.gif)
