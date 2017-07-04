module Complimentor
  class Response
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
      return '<3' if thumbsup?

      RESPONSES.sample
    end

    private

    THUMBSUP_STICKER_ID = 369239263222822

    def thumbsup?
      message.attachments[0]['payload']['sticker_id'] == THUMBSUP_STICKER_ID
    rescue
      false
    end
  end
end
