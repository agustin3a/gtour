class AddSiteIdToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :site_id, :integer
  end
end
