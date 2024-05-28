class AddNumberToChat < ActiveRecord::Migration[5.2]
  def change
    add_column :chats, :number, :integer, default: 0
  end
end
