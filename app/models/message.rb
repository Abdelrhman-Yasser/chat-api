class Message < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  belongs_to :chat

  validates :body, presence: true

  settings do
    mappings dynamic: 'false' do
      indexes :body, type: :text, analyzer: 'english'
    end
  end

  def self.search_in_chat(chat_id, query)
    __elasticsearch__.search(
      {
        query: {
          bool: {
            must: [
              { wildcard: { body: "*#{query}*" } },
              { term: { chat_id: chat_id } }
            ]
          }
        }
      }
    )
  end
end

# Create the index with the specified mapping
Message.__elasticsearch__.create_index!
# Index all existing messages
Message.import
