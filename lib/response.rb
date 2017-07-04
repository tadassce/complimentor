module Complimentor
  class Response
    GREETINGS = [
      'Hey!',
      'Hello :)',
      '👋',
      'Hi',
      'Olá'
    ]

    RESPONSES = [
      'You are beautiful',
      'Have a great day!',
      'You are great.',
    ]

    attr_reader :message

    def initialize(message)
      @message = message
      p message
    end

    def text
      case
      when thumbsup? then '<3'
      when greeting? then GREETINGS.sample
      else                RESPONSES.sample
      end
    end

    private

    THUMBSUP_STICKER_ID = 369239263222822

    def thumbsup?
      message.attachments[0]['payload']['sticker_id'] == THUMBSUP_STICKER_ID
    rescue
      false
    end

    def greeting?
      message.text =~ /(hi)|(hey)|(hello)|(good morning)|(good evening)|(hej)|(halo)|(hallo)|(ola)|(olá)/i
    end
  end
end
