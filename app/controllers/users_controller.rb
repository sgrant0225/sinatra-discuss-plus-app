class UsersController < ApplicationController

#users signup informtion will be stored here

 get '/users/new' do
 
  erb :'/users/new'
 end 

 post '/users' do
   binding.pry
   new_user = User.new(params)
  #  if new_user.save 
  #  sessions[:user_id] = new_user.id 
 end   
end    