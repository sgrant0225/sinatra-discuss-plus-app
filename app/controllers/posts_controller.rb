class PostsController < ApplicationController

   get '/posts' do
    @posts = PostDiscussion.all 
    
   erb :'/posts/index'
   end 
end    

#user should edit their own posts