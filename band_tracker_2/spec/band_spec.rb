
require('spec_helper')

  describe(Band) do
    it { should have_and_belong_to_many(:venues) }
  end

  it('validates the presence of a band name') do
    band = Band.new({:name => ''})
    expect(band.save).to(eq(false))
  end
