class MessageWorker
    include Sidekiq::Worker
  
    def perform(chat_id, body)
      chat = Chat.find(chat_id)
      chat.with_lock do
        message = chat.messages.new(body: body)
        message.number = chat.messages.count + 1
        message.save!
        chat.update(messages_count: chat.messages.count)
      end
    end
  end
  