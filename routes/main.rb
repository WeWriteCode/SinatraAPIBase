# encoding: utf-8

##~ root = source2swagger.namespace("api-docs")
##~ root.basePath = ""
##~ root.swaggerVersion = "1.1"
##~ root.apiVersion = "1.0"
###~ root.apis.add :path => "/api-docs/sample", :description => ""

# class WWCAPI < Sinatra::Application

before do
  content_type 'application/json'
end

get "/api-docs" do
  path = ENV["RACK_ENV"] == "development" ? "public/api" : "api"

  res = File.read(File.join(settings.root, path, 'api-docs.json'))
  body res
  status 200
end

get "/api-docs/:api" do
  path = ENV["RACK_ENV"] == "development" ? "public/api" : "api"

  res = File.read(File.join(settings.root, path, "#{params[:api].to_s}.json"))
  body res
  status 200
end

# end
