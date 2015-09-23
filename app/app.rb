require 'sinatra/base'
require_relative 'data_mapper_setup'

class BookmarkManagerWeb < Sinatra::Base
  
  get '/links' do
    @links = Link.all 
    erb :index
  end

  post '/links' do
    link = Link.create(url: params[:url], title: params[:title])
    tag = Tag.create(name: params[:tag])
    link.tags << tag 
    link.save
    redirect '/links'
  end

  get '/links/new' do
    erb :new_link
  end

  get '/tags/:name' do 
    tag = Tag.first(name: params[:name])
    @links = tag ? tag.links : []
    erb :index
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
