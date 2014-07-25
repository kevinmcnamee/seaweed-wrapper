require 'spec_helper'

describe 'homepage' do
  it 'shows current swell height for closest break' do
    visit root_path

    expect(find('h1').text).to eq 'Local Surf for Holyoke'

    expect(find('span.avg-height').text).not_to be_empty
  end
end
