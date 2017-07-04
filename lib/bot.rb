require 'facebook/messenger'
require_relative 'response'

Facebook::Messenger::Subscriptions.subscribe(access_token: ENV.fetch('ACCESS_TOKEN'))

Facebook::Messenger::Bot.on :message do |message|
  message.reply(text: Complimentor::Response.new(message).text)
end
