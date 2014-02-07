class AddAttachmentThumToPins < ActiveRecord::Migration
  def self.up
    change_table :pins do |t|
      t.attachment :thum
      t.string :video_description
    end
  end

  def self.down
    drop_attached_file :pins, :thum
  end
end
