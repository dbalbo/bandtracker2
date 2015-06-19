require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file}


get('/')  do
	erb(:index)
end

get('/bands') do
	@band = Band.all
	erb(:band)
end

post('/band') do
	name = params.fetch('name')
	Band.create({:name => name, :id => nil})
	@bands = Band.all
	erb(:band)
end

get('/venues') do
	@venues = Venue.all
	erb(:venues)
end

post('/venues') do
	description = params.fetch('description')
	Venue.create({:description => description, :id => nil})
	@venue = Venue.all
	erb(:venues)
end

get('/band/:id') do
	@band = Band.find(params.fetch('id').to_i)
	@venue = Venue.all
	erb(:bands)
end

patch('/band/:id') do
  band_id = params.fetch('id').to_i	
  @band = Band.find(band_id)
  venue_ids = params.fetch('venue_ids')
  @band.update(:venue_ids => venue_ids)
  @venues = Venue.all()
  erb(:band)
end

delete('/band/:id') do
  @band = Band.find(params.fetch("id").to_i)
  @band.delete()
  @bands = Band.all()
  erb(:bands)
end

patch('/venue/band/:id') do
  @band = Band.find(params.fetch("id").to_i())
  venue_ids = params.fetch("venue_ids")
  @band.update({:venue_ids => venue_ids})
  @venues = Venue.all()
  @venues_checked = @band.venues.ids
  erb(:band)
end

get('/venue/:id') do
  @venue = Venue.find(params.fetch("id"))
  erb(:venue)
end
