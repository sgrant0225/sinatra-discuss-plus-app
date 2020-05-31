require 'rack-flash'

class UsersController < ApplicationController
 
#users signup informtion will be stored here

 get '/signup' do
 
  erb :'/signup'
 end 

 post '/users' do
   @new_user = User.new(params)
    if @new_user.save 
    session[:user_id] = @new_user.id 
    redirect "/users/#{@new_user.id}"
    
    #instead of login page redirect to a show page
    else
      redirect '/signup'
  end
 end
 
 #get user login and show login form for existing users. Need get request and login erb file
 #post request 1.Find the user #authenticate the user Redirect to the users landing show page

  get '/login' do
   erb :'/login'
  end

  post '/login' do
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password]) 
      session[:user_id] = @user.id 
      redirect "users/#{@user.id}"
    else 
      
      erb :'error/login_error'
    end
  end 
  
  get '/users/:id' do 
   "This will be the user show route"
   @user = User.find_by(id: params[:id])
   erb :'/users/show'
  end 
  
  get '/logout' do
   session.clear
   redirect '/'
  end

  
end    