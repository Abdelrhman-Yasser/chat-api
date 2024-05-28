class CreateChats < ActiveRecord::Migration[5.2]
  def change
    create_table :chats do |t|
      t.references :application, null: false, foreign_key: true
      t.string :name
      t.integer :messages_count, default: 0

      t.timestamps
    end
  end
end