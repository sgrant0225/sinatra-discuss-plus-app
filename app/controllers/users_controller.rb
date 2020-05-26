class UsersController < ApplicationController
 
#users signup informtion will be stored here

 get '/signup' do
 
  erb :'/signup'
 end 

 post '/signup' do
   @new_user = User.new(params)
    if @new_user.save 
    session[:user_id] = @new_user.id 
    binding.pry
    redirect '/login'
    #instead of login page redirect to a show page
    else
      erb :'/signup'
  end
 end
 
 #get user login and show login form for existing users. Need get request and login erb file
 #post request 1.Find the user #authenticate the user Redirect to the users landing show page

  get '/login' do
   "THIS IS THE LOGIN PAGE"
   erb :'/login'
  end

  # post 'login'

  # end 
 
end    