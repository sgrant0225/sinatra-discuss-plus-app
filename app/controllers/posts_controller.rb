class PostsController < ApplicationController

   get '/posts' do #index route action
    @posts = PostDiscussion.all 
    
   erb :'/posts/index' #displays all articles
   end 

   get '/posts/new' do
   
   erb :'/posts/new'
   end 

   post '/posts' do #creates a new post
     if !logged_in? 
      redirect '/'
     end
     if params[:topic] && params[:content] && params[:date] != ""
      @post = PostDiscussion.create(topic: params[:topic], content: params[:content], date: params[:date], user_id: session[:id])
      # binding.pry
      redirect "/posts/#{@post.id}"
     else
      redirect '/posts/new'
     end
   end  

   get '/posts/:id' do
    @post = PostDiscussion.find_by(id: params[:id])
     erb :'/posts/show' 
   end 
   
   get '/posts/:id/edit' do #route to edit displays form to posts
     @post = PostDiscussion.find_by(id: params[:id])
    erb :'/posts/edit' 
   end
   
   patch '/posts/:id' do  #action handles the edit form submission
    @post = PostDiscussion.find_by_id(params[:id]) 
    @post.topic = params[:topic]
    @post.content = params[:content]
    @post.date = params[:date]
    @post.save 
    redirect to "/posts/#{@post.id}"
   end

   delete '/posts/:id' do #delete action
    @post = PostDiscussion.find_by_id(params[:id])
    @post.delete
    redirect to '/posts'
  end
end    

#user should edit their own posts