require './mott'
require File.expand_path '../mott.rb', __FILE__

run Rack::URLMap.new({
  "/" => Public,
  "/protected" => Protected
})

#run Sinatra::Application
