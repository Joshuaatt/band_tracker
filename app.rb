require 'bundler/setup'
require 'pry'

Bundler.require :default
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }
also_reload 'lib/**/*.rb'

get '/' do
  erb :index
end

get '/bands/new' do
  erb :new_band
end

get '/bands' do
  @bands = Band.all
  erb :bands
end

post '/bands' do
  band_name = params.fetch("band_name")
  @band = Band.new(band_name: band_name)
  @band.save
  redirect '/bands'
end

get '/band/:id' do
    @band = Band.find(params.fetch('id').to_i)
    @venues = @band.venues
    erb :band
end

post '/band/:id' do
  band = Band.find(params.fetch('id').to_i)
  band_id = band.id
  new_venue_name = params.fetch("venue_name")
  venue = Venue.create({ venue_name: new_venue_name })
  band.update({ :venue_ids => [venue.id] })
  redirect "/band/#{band_id}"
end

get '/band/:id/edit' do
  @band = Band.find(params.fetch('id').to_i)
  @venue = Venue.all
  
  erb :edit_band
end

delete '/band/:id/edit' do
  band = Band.find(params.fetch('id'))
  band.delete
  redirect '/bands'
end

patch '/band/:id/edit' do
  @band = Band.find(params.fetch('id'))
  new_band_name = params.fetch('new_band_name')
  @band.update({ band_name: new_band_name })
  redirect '/bands'
end
