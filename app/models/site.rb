class Site < ActiveRecord::Base
	belongs_to :place
	 validates_uniqueness_of :place_id,:message => "Place already have a site associated"

	 has_many :pictures
end
