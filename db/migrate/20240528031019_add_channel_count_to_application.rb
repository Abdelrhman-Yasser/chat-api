class AddChannelCountToApplication < ActiveRecord::Migration[5.2]
  def change
    add_column :applications, :channel_count, :integer
  end
end
