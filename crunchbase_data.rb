require 'net/http'
require 'uri'
require 'json'
require 'mongo'

# http://www.crunchbase.com/api

namespace = ARGV[0] # company, person, financial-organization, product, service-provider
permalink = ARGV[1]

uri = URI.parse("http://api.crunchbase.com/v/1/#{namespace}/#{permalink}.js")

response = Net::HTTP.get_response(uri)

@db = Mongo::Connection.new("localhost", 27017).db("zaliczenie")
@collection = @db.collection(namespace+"_"+permalink)

document = JSON.parse(response.body)

@collection.insert(document)
