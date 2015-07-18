class AddAttachmentImageToSeeds < ActiveRecord::Migration
  def self.up
    change_table :seeds do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :seeds, :image
  end
end
