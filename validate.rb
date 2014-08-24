#!/usr/bin/env ruby

require 'rubygems'
require 'json-schema'

schema = 'schemata/talk.json'

examples = Dir['examples/*.json']

examples.each do |example|
  print "Validating #{example} .. "
  begin
    json = JSON.parse(File.read(example))
    JSON::Validator.validate!(schema, json, validate_schema: true)
    puts "valid"
  rescue JSON::ParserError => e
    puts "invalid JSON"
  rescue JSON::Schema::ValidationError => e
    puts "valid JSON, but schema #{schema} is violated"
    puts e.inspect
  end
end
