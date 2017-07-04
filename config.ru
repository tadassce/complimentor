require_relative 'app'
require_relative 'lib/bot'

map('/') do
  run Sinatra::Application
  run Facebook::Messenger::Server
end
