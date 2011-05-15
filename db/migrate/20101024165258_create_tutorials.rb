class CreateTutorials < ActiveRecord::Migration
  def self.up
    create_table :tutorials do |t|
      t.integer :number
      t.string :title
      t.integer :author_id
      t.text :body
      t.text :video

      t.timestamps
    end
  end

  def self.down
    drop_table :tutorials
  end
end
