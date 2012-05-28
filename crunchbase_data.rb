# encoding: utf-8
require 'net/http'
require 'uri'
require 'json'
require 'mongo'

# http://www.crunchbase.com/api

plural_namespace = ARGV[0] # companies, people, financial-organizations, products, service-providers
namespace = ARGV[1] # company, person, funancial-organization, product, service-provider
base_url = "http://api.crunchbase.com/v/1"

available_entities_for_namespace_uri = URI.parse("#{base_url}/#{plural_namespace}.js")

available_entities_for_namespace_response = Net::HTTP.get_response(available_entities_for_namespace_uri)

@db = Mongo::Connection.new("localhost", 27017).db("zaliczenie")
@collection = @db.collection(plural_namespace)
@collection.drop

available_entities_for_namespace_json = JSON.parse(available_entities_for_namespace_response.body)
collection_size = ARGV[2].to_i
if collection_size == 0   # maksymalna ilość dokumentów jeśli została podana (lub jesli zostala podana 0) albo wszystkie
	collection_size = available_entities_for_namespace_json.size
end
puts "Ilość dokumentów dla kolekcji #{plural_namespace} #{collection_size}" 
available_entities_for_namespace_json.take(collection_size).each do |json|
	entity_url = "#{base_url}/#{namespace}/#{json['permalink']}.js"
	entity_uri = URI.parse(entity_url)
	entity_response = Net::HTTP.get_response(entity_uri)
	document = JSON.parse(entity_response.body)
	@collection.insert(document)
	collection_size -= 1
	puts "Dodano dokument dla #{json['name']}. Pozostało #{collection_size}."
end
