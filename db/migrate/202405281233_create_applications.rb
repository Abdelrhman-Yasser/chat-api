class CreateApplications < ActiveRecord::Migration[5.2]
    def change
      create_table :applications do |t|
        t.string :token, unique: true
  
        t.timestamps
      end
      add_index :applications, :token, unique: true
    end
  end
  