class AddAttachmentAttachmentToPhotos < ActiveRecord::Migration[5.1]
  def self.up
    change_table :photos do |t|
      t.attachment :attachment
    end
  end

  def self.down
    remove_attachment :photos, :attachment
  end
end
