module Complimentor
  CONTACTS = {
    fn: 1512307118808420,
    ts: 1398485296925653
  }

  class Message
    attr_reader :to, :text

    def initialize(to:, text:)
      @to, @text = to, text
    end

    def deliver
      Facebook::Messenger::Bot.deliver({
        recipient: {
          id: CONTACTS.fetch(to, to)
        },
        message: {
          text: text
        }
      }, access_token: ENV.fetch('ACCESS_TOKEN'))
    end
  end
end
