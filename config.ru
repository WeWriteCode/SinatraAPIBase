ENV['RACK_ENV'] = 'development'

require ::File.join( ::File.dirname(__FILE__), 'app' )
run WWCAPI.new