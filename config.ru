require 'bundler/setup'

Bundler.require(:default, ENV['RACK_ENV'])

use Rack::StaticCache, :urls => ['/assets', '/stylesheets', '/javascripts', '/fonts', '/lib'], :root => 'public'

use Rack::Rewrite do
  rewrite '/', '/index.html'
end

use Rack::SSL

run Rack::Directory.new('public')
