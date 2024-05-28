class ChatWorker
    include Sidekiq::Worker
  
    def perform(application_id, name)
      application = Application.find(application_id)
      application.with_lock do
        chat = application.chats.new(name: name)
        chat.number = application.chats.count + 1
        chat.save!
        application.update(channel_count: application.chats.count)
      end 
    end
  end
  