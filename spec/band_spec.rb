require 'spec_helper'

describe Band do
  it { should have_and_belong_to_many :venues }
  it { should validate_presence_of :band_name}

  it "capitalizes the band name" do
    test_band = Band.create(band_name: 'bach')
    expect(test_band.band_name).to eq 'Bach'
  end
end
