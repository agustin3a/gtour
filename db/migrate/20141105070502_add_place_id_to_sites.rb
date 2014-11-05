class AddPlaceIdToSites < ActiveRecord::Migration
  def change
    add_column :sites, :place_id, :integer
  end
end
