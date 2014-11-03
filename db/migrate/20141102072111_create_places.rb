class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :name
      t.integer :type
      t.string :address
      t.string :phone
      t.string :website
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
