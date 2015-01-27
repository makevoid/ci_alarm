require 'net/http'
require 'json'
require 'sinatra'

PROJECT = "quillcontent/wms"

URL = "https://circleci.com/api/v1/project/#{PROJECT}}?circle-token=#{ENV["CIRCLE_TOKEN"]}&limit=1&offset=0"

get "/" do
  res = Net::HTTP.get_response URI URL
  res = JSON.parse res.body
  if res.first["status"] == "failed"
    "red"
  else
    "green"
  end
end
