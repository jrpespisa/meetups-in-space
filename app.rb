require 'sinatra'
require_relative 'config/application'
require 'pry'

helpers do
  def current_user
    user_id = session[:user_id]
    @current_user ||= User.find(user_id) if user_id.present?
  end
end

get '/' do
  redirect '/meetups'
end

get '/auth/github/callback' do
  user = User.find_or_create_from_omniauth(env['omniauth.auth'])
  session[:user_id] = user.id
  flash[:notice] = "You're now signed in as #{user.username}!"

  redirect '/'
end

get '/sign_out' do
  session[:user_id] = nil
  flash[:notice] = "You have been signed out."

  redirect '/'
end

get '/meetups' do
  @meetups = Meetup.all.order("lower(name)")
  erb :'/meetups/index'
end

get "/meetups/new" do
  if session[:user_id] == nil
    flash[:notice] = "You need to sign in first!"
    redirect "/"
  else
    erb :'/meetups/new'
  end
end

get "/meetups/:id" do
  @meetup = Meetup.find(params[:id])
  @members = @meetup.users
  erb :'/meetups/show'
end

post "/meetups/new" do
  current_user
  @name = params[:name]
  @description = params[:description]
  @location = params[:location]

  if @name.strip.empty? || @description.strip.empty? || @location.strip.empty?
    erb :'/meetups/new'
  else
    @new_meetup = Meetup.create(name: params[:name], description: params[:description], location: params[:location], creator: @current_user.username)
    flash[:notice] = "New meetup created!"
    redirect "/meetups/#{@new_meetup.id}"
  end
end

post "/meetups/:id" do
  if session[:user_id] == nil
    flash[:notice] = "You need to sign in first!"
  else
    @new_user = Membership.create(user_id: session[:user_id], meetup_id: params[:id])
    flash[:notice] = "You have joined the meetup!"
  end
  redirect "/meetups/#{params[:id]}"
end
