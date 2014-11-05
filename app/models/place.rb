class Place < ActiveRecord::Base
	self.inheritance_column = nil
	has_one :site
end
