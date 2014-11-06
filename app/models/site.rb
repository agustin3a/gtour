class Site < ActiveRecord::Base
	belongs_to :place
	 validates_uniqueness_of :place_id,:message => "Place already have a site associated"

	has_attached_file :image, :styles => { :medium => "500x500>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

	DISQUS_SHORTNAME = Rails.env == "development" ? "tourg".freeze : "GTour".freeze

end
