require 'sinatra/base'
require_relative 'helpers'
require_relative 'data_mapper_setup'

class BookmarkManagerWeb < Sinatra::Base

  include Helpers

  enable :sessions
  set :session_secret, 'super secret'
  
  get '/links' do
    @links = Link.all 
    erb :index
  end

  post '/links' do
    link = Link.create(url: params[:url], title: params[:title])
    params[:tags].split.each do |tag|
      link.tags << Tag.create(name: tag) 
    end
    link.save
    redirect to('/links')
  end

  get '/links/new' do
    erb :new_link
  end

  get '/tags/:name' do 
    tag = Tag.first(name: params[:name])
    @links = tag ? tag.links : []
    erb :index
  end

  post '/users' do 
    user = User.create(email: params[:email], 
                       password: params[:password], 
                       password_confirmation: params[:password_confirmation])
    session[:user_id] = user.id
    redirect to('/links')
  end

  get '/users/new' do 
    erb :new_users
  end

  # helpers do 
  #   include Helpers
  # end


  

  # start the server if ruby file executed directly
  run! if app_file == $0
end
