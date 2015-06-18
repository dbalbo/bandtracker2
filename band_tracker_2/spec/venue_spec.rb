require('spec_helper')

describe(Venue) do
	 describe('#bands') do
	 	it('returns all bands playing at the same venue')do
	 	band1 = Band.create(:name => 'Los Weirdos', :genre => 'pop')
	 	band2 = Band.create(:name => "Playas", :genre => 'jazz')
	 	venue = Venue.create({:description => 'The Venue', :address => '123 Stone Street', :band_ids => [band1.id, band2.id]})
	 end
	end

	it('converts venue name to capital letters at beginning of each word') do
		venue = Venue.create(:description => 'the venue', :address => '123 stone street')
		expect(venue.description).to(eq('The Venue'))
	end
end



