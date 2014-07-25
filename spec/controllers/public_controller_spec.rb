require 'spec_helper'

describe PublicController do
  describe '#index' do
    let(:surf_spot) { double(:surf_spot) }
    let(:spot_search) { double(:spot_search, surf_spot: surf_spot) }

    let(:surf_spot_params) do
      {
        spot_id: '389'
      }
    end

    it 'assigns the surf spot' do
      allow(SpotSearch).to receive(:new).with(surf_spot_params) { spot_search }
      expect(spot_search).to receive(:surf_spot).and_return(surf_spot)

      get :index, params: surf_spot_params
    end
  end
end
