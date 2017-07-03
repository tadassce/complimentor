require 'facebook/messenger'
include Facebook::Messenger

Facebook::Messenger::Subscriptions.subscribe(access_token: ENV.fetch('ACCESS_TOKEN'))

responses = [
  'You are beautiful',
  'Have a great day!',
  'You are great.',
]

def thumbsup?(message)
  message.attachments[0]['payload']['sticker_id']
rescue
  false
end

Bot.on :message do |message|
  p message

  text =
    if thumbsup?(message)
      '😘'
    else
      responses.sample
    end

  message.reply(text: responses.sample)
end
