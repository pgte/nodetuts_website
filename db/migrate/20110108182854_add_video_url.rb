class AddVideoUrl < ActiveRecord::Migration
  def self.up
    add_column :tutorials, :video_url, :string
  end

  def self.down
    remove_column :tutorials, :video_url
  end
end
