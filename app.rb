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
    @band = Band.find(params.fetch('id'))
    erb :band
end
