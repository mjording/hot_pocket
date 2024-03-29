class AddAttachmentPictureToPockets < ActiveRecord::Migration
  def self.up
    change_table :pockets do |t|
      t.has_attached_file :picture
    end
  end

  def self.down
    drop_attached_file :pockets, :picture
  end
end
