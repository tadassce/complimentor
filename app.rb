require 'sinatra'

get '/' do
  params['hub.challenge'] if ENV['VERIFY_TOKEN'] == params['hub.verify_token']
end
