class AddAttachmentImageToClips < ActiveRecord::Migration
  def self.up
    change_table :clips do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :clips, :image
  end
end
