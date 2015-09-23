require 'sinatra/base'
require_relative 'data_mapper_setup'

class BookmarkManagerWeb < Sinatra::Base
  
  get '/links' do
    @links = Link.all 
    erb :index
  end

  post '/links' do
    Link.create(url: params[:url], title: params[:title])
    redirect '/links'
  end

  get '/links/new' do
    erb :new_link
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
