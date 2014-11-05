ActiveAdmin.register Site do
   permit_params :title, :body, :place_id, :image

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end


filter :title
filter :place_id, :as => :select, :collection => Place.all


index  :default => true do 
    column :title
    column :place_id
    actions
  end
  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "Place" do
      f.input :place_id, :as => :select, :collection => Place.all
      f.input :title
      f.input :body
      f.input :image
    end
    f.actions
  end


end
