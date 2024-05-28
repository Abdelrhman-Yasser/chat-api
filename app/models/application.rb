
class Application < ApplicationRecord
  has_many :chats
  validates :name, presence: true
  before_create :generate_token

  private

  def generate_token
    self.token = SecureRandom.hex(10)
  end
end
