class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.references :chat, null: false, foreign_key: true
      t.integer :number
      t.text :body

      t.timestamps
    end
  end
end
