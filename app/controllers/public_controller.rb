class PublicController < ApplicationController
  def index
    @surf_spot = SpotSearch.new(surf_params).surf_spot
  end

  private

  def surf_params
    {
      spot_id: '389'
    }
  end
end
