class PostsController < ApplicationController

   get '/posts' do #index route action
    @posts = PostDiscussion.all 
    
   erb :'/posts/index' #displays all articles
   end 

   get '/posts/new' do
   
   erb :'/posts/new'
   end 

   post '/posts' do 
    @post = PostDiscussion.create(:topic => params[:topic], :content => params[:content], :date => params[:date])
    redirect "/posts/#{@post.id}"
   end  

   get '/posts/:id' do
    
     erb :'/posts/show' 
   end 
end    

#user should edit their own posts