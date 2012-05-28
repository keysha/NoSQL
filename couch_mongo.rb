# encoding: utf-8
require 'mongo'
require 'couchrest'

default_couchdb_port = 5984
default_mongodb_port = 27017

# http://localhost:5984/_utils

plural_namespace = ARGV[0] # companies, people, financial-organizations, products, service-providers

@mongodb = Mongo::Connection.new("localhost", default_mongodb_port).db("zaliczenie")
@collection = @mongodb.collection(plural_namespace)

@couchdb = CouchRest.database!("http://localhost:#{default_couchdb_port}/zaliczenie")
@couchdb.recreate!

jsons = []
i = 1
limit = 1000
count = @collection.count 
while i * limit - limit < count do
  jsons = @collection.find(nil,{:limit => limit, :skip => (i * limit - limit)}).to_a
  jsons.collect do |item|
    item.delete("_id") # usuwam pole _id
  end
  @couchdb.bulk_save(jsons)
  progress = ((i.to_f * limit)/count) * 100
  puts "przekopiowano " << progress.round(1).to_s << "%"
  i+=1
end
