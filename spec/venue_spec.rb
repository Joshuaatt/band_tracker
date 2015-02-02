require 'spec_helper'

describe Venue do
  it { should have_and_belong_to_many :bands}
  it { should validate_presence_of :venue_name}

  it 'Capitalizes the venue name' do
    test_venue = Venue.create(venue_name: 'stubbs')
    expect(test_venue.venue_name).to eq 'Stubbs'
  end
end
