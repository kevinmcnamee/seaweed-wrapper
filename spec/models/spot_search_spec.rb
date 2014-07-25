require 'spec_helper'

describe SpotSearch do
  let(:spot_params) { {spot_id: '367'} }
  let(:spot_search) { SpotSearch.new(spot_params) }
  let(:surf_spot_response) do
    [
      {
        timestamp: 1406073600,
        localTimestamp: 1406073600,
        swell: {
          minBreakingHeight: 1,
          absMinBreakingHeight: 1.24,
          maxBreakingHeight: 2,
          absMaxBreakingHeight: 1.93,
          unit: "ft",
          components: {
            combined: {
              height: 1.6,
              period: 9,
              direction: 86.2,
              compassDirection: "W"
            }
          }
        },
        wind: {
          speed: 6,
          direction: 204,
          compassDirection: "NNE",
          chill: 61,
          gusts: 10,
          unit: "mph"
        },
        condition: {
          pressure: 1022,
          temperature: 61,
          weather: 10,
          unitPressure: "mb",
          unit: "f"
        }
      }
    ]
  end

  describe '#surf_spot' do
    it 'executes a search on magicseaweed api' do
      expect(MagicSeaweed).to receive(:find).with(spot_params[:spot_id])

      spot_search.surf_spot
    end

    it 'instantiates a surf spot object' do
      allow(MagicSeaweed).to receive(:find).and_return(surf_spot_response)
      expect(SurfSpot).to receive(:new).with(surf_spot_response)

      spot_search.surf_spot
    end
  end
end
