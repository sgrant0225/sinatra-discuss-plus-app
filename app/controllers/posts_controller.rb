class PostsController < ApplicationController

   get '/posts' do #index route action
      if !logged_in? 
        redirect '/'
      else
      @posts = PostDiscussion.all 
    
      erb :'/posts/index' #displays all posts
      end
   end 

   get '/posts/new' do
      if !logged_in?  
        redirect '/'
      else
       erb :'/posts/new'
      end
   end 

   post '/posts' do #creates a new post
     if !logged_in? 
      redirect '/'
     end
     if params[:topic] && params[:content] && params[:date] != ""
      @post = PostDiscussion.create(topic: params[:topic], content: params[:content], date: params[:date], user_id: current_user.id)
      # binding.pry
      redirect "/posts/#{@post.id}"
     else
      redirect '/posts/new'
     end
   end  

   get '/posts/:id' do
    if !logged_in?
      redirect '/'
    else
    @post = PostDiscussion.find_by(id: params[:id])
     erb :'/posts/show' 
    end
   end 
   
   get '/posts/:id/edit' do #route to edit displays form to posts
     if !logged_in? 
      redirect '/'
      else
      @post = PostDiscussion.find_by(id: params[:id])
      erb :'/posts/edit' 
   end
  end
   
   patch '/posts/:id' do  #action handles the edit form submission
     set_post
    if logged_in? && if authorized_to_edit?(@post)
       #binding.pry
        @post.update(topic: params[:topic], content: params[:content], date: params[:date])  
        redirect "/posts/#{@post.id}"
    # @post = PostDiscussion.find_by_id(params[:id]) 
    # @post.topic = params[:topic]
    # @post.content = params[:content]
    # @post.date = params[:date]
    # @post.save 
    # redirect "/posts/#{@post.id}"
       else
        redirect "users/#{current_user.id}"
       end
       redirect '/'
       end
   end

   delete '/posts/:id' do #delete action
    if !logged_in?
      redirect '/'
    elsif current_user
    @post = PostDiscussion.find_by_id(params[:id])
    @post.delete
    redirect '/posts'
    end
  end
  
  
  def set_post
   @post = PostDiscussion.find_by(id: params[:id])
  end
  
end    

#user should edit their own posts