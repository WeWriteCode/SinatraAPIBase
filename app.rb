# encoding: utf-8
require 'sinatra'
require "sinatra/activerecord"
require 'yaml'

I18n.config.enforce_available_locales=false

env = ENV["RACK_ENV"] ? ENV["RACK_ENV"] : "development"

CONFIG = YAML::load_file(File.join(File.dirname(__FILE__), 'config/db.yml'))[env]

ActiveRecord::Base.establish_connection(
  :adapter  => CONFIG["adapter"],
  :database => CONFIG["database"],
  :username => CONFIG["username"],
  :password => CONFIG["password"],
  :host     => CONFIG["host"]
)

class WWCAPI < Sinatra::Application

  configure :development do

    require "sinatra/reloader"
    
    register Sinatra::Reloader
    Dir["models/*.rb"].each do | f |
      also_reload f
    end

    Dir["helpers/*.rb"].each do | f |
      also_reload f
    end

    Dir["routes/*.rb"].each do | f |
      also_reload f
    end
  end

	helpers do
		include Rack::Utils
	end
end

require_relative 'helpers/init'
require_relative 'models/init'
require_relative 'routes/init'