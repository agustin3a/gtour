ActiveAdmin.register Place do
  permit_params :name, :type, :address, :phone, :website, :latitude, :longitude

  config.per_page = 15

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  #permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end
  form do |f|
    f.inputs "Place" do
      f.input :name
      f.input :address
      f.input :phone
      f.input :website
      f.input :type,  :as => :select, :collection => [["Park", 1], ["Church", 2], ["Museum", 3], ["Hotel", 4], ["Restaurant" , 5], ["Shop" , 6]]
      f.input :latitude
      f.input :longitude
    end
    f.actions
  end

index  :default => true do 
    column :name
    column :address
    column :phone
    column :website
    column :type do |place|
      if place.type == 1 
        "Park"
      elsif place.type == 2
        "Church"
      elsif place.type == 3
        "Museum"
      elsif place.type == 4
        "Hotel"
      elsif place.type == 5
        "Restaurant"
      elsif place.type == 6
        "Shop"
      end
    end
    actions
  end

  filter :name
  filter :type, :as => :select, :collection => [["Park", 1], ["Church", 2], ["Museum", 3], ["Hotel", 4], ["Restaurant" , 5], ["Shop" , 6]]


end
