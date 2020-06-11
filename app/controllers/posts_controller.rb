class PostsController < ApplicationController

   get '/posts' do #index route action
      redirect_if_not_logged_in
        @posts = PostDiscussion.all 
        erb :'/posts/index' #displays all posts
    end 

    get '/posts/new' do
       redirect_if_not_logged_in
       erb :'/posts/new'
    end 

   post '/posts' do #creates a new post
      redirect_if_not_logged_in
      if params[:topic] && params[:content] && params[:date] != ""
        post = current_user.post_discussions.create(topic: params[:topic], content: params[:content], date: params[:date])
        redirect "/posts/#{post.id}"
     else
      redirect '/posts/new'
     end
   end  

   get '/posts/:id' do
      redirect_if_not_logged_in
      set_post
      erb :'/posts/show' 
   end 
   
   get '/posts/:id/edit' do #route to edit displays form to posts
       redirect_if_not_logged_in
       set_post
       erb :'/posts/edit' 
   end
   
   patch '/posts/:id' do  #action handles the edit form submission
     set_post
    if logged_in? && authorized_to_edit?(@post)
        @post.update(topic: params[:topic], content: params[:content], date: params[:date])  
        redirect "/posts/#{@post.id}"
    else
        redirect "users/#{current_user.id}"
    end
   end
  
      
  

   delete '/posts/:id' do #delete action
    set_post
    if !logged_in?
      redirect '/'
    elsif authorized_to_edit?(@post)
      @post.delete
    end
      redirect '/posts'
  end

  
  
  def set_post
   @post = PostDiscussion.find_by(id: params[:id])
  end
 
end    

