class SitesController < InheritedResources::Base

    before_action :set_site, only: [:show, :edit, :update, :destroy]

    def sidebar_places(type)
    	return Site.joins(:place).where('places.type' => type)
    end

    def show
    	@parks = sidebar_places(1)
    	@churchs = sidebar_places(2)
    	@museums = sidebar_places(3)
    end

    def index
    	@parks = sidebar_places(1)
    	@churchs = sidebar_places(2)
    	@museums = sidebar_places(3)
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_site
      @site = Site.find(params[:id]) 
    end
end

