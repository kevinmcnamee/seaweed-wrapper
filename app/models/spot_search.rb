class SpotSearch
  def initialize(args)
    @args = args
  end

  def surf_spot
    @surf_spot ||= find_surf_spot
  end

  private

  def find_surf_spot
    response = MagicSeaweed.find(@args[:spot_id])
    SurfSpot.new(response)
  end
end
