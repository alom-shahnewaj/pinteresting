class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.integer :user_id
      t.string :description
      t.attachment :video

      t.timestamps
    end
    add_index :videos, :user_id
  end
end
