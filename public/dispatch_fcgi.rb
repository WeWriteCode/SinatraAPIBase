#!/usr/bin/ruby

fastcgi_log = File.open('fastcgi.log', 'a')
STDOUT.reopen fastcgi_log
STDERR.reopen fastcgi_log
STDOUT.sync = true

# Dreamhost strips many environment variables
# ENV['HOME'] must be set for expand_path to work
ENV['HOME'] ||= `echo ~`.strip
#ENV['GEM_PATH'] ||= `gem env path`.strip
#ENV['GEM_HOME'] ||= File.expand_path('~/.gems')
ENV['RACK_ENV'] = 'production'

# Debug environment variables (print to fastcgi_log file)
#puts "========"
#puts ENV.inspect

# Add app directory to the path
$:.unshift File.join(File.dirname(__FILE__), '..')

require 'rubygems'
Gem.clear_paths

require 'rack'
require 'sinatra'

module Rack
  class Request
    def path_info
      @env["REDIRECT_URL"].to_s
    end
    def path_info=(s)
      @env["REDIRECT_URL"] = s.to_s
    end
  end
end

require 'app'

builder = Rack::Builder.new do
  map '/' do
    run WWCAPI.new
  end
end

Rack::Handler::FastCGI.run(builder) 
