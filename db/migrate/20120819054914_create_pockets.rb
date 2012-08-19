class CreatePockets < ActiveRecord::Migration
  def change
    create_table :pockets do |t|
      t.string :data_url
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
