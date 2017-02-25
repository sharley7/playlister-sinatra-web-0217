require 'rack-flash'
class SongController < ApplicationController
  enable :sessions
  use Rack::Flash


   get '/songs' do
     @songs = Song.all
     erb :'songs/index'
   end

   post '/songs' do
    @song = Song.create(params)
    flash[:message] = "Successfully created song."
    redirect to "/songs/#{@song.slug}"
    end

   get '/songs/new' do
     erb :'songs/new'
   end

   get '/songs/:slug/edit' do
     @song = Song.find_by_slug(params[:slug])
     erb :'/songs/edit'
   end

   get '/songs/:slug' do
     @song = Song.find_by_slug(params[:slug])
     erb :'songs/show'
   end

   get '/songs/:slug/edit' do
     @song = Song.find_by_slug(params[:slug])
     erb :'/songs/edit'
   end

   post '/songs/:slug' do
     @song = Song.update(params)
    redirect to "/songs/#{@song.slug}"
  end



end
