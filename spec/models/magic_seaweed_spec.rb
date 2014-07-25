require 'spec_helper'

describe MagicSeaweed do
  describe '.find' do
    it 'retrieves the proper spot from MagicSeaweed' do
      json_response = MagicSeaweed.find('389')

      expect(json_response.first['timestamp']).to be_present
    end
  end
end
