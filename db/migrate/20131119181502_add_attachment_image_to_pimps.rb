class AddAttachmentImageToPimps < ActiveRecord::Migration
  def self.up
    change_table :pimps do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :pimps, :image
  end
end
