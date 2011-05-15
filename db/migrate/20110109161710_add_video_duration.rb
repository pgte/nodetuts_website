class AddVideoDuration < ActiveRecord::Migration
  def self.up
    add_column :tutorials, :duration, :string
  end

  def self.down
    remove_column :tutorials, :duration
  end
end
