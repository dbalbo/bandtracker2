
require('spec_helper')

  describe Band do
  describe('#venues') do
    it('returns all venues at which the  band will play') do
      venue1 = Venue.create(description: "The Box", address: "111 Edmond Rd. Portland, OR 90210")
      venue2 = Venue.create(description: "Ziggy's", address: "222 Edmond Rd. Lookout, WV 90210")
      band = Band.create(name: "SmithJonez", genre: "Screamo", venue_ids: [venue1.id(), venue2.id()])
    end
  end
  
  it('validates the presence of a band name') do
    band = Band.new({:name => ''})
    expect(band.save).to(eq(false))
  end

  it('converts any band name to start with a capital letter') do
  	band = Band.create(:name => "los weirdos", :genre => 'pop')
  	expect(band.name).to(eq('Los Weirdos'))
  end
end