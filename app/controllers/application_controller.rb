require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end

  get "/" do
    if logged_in?
      redirect "users/#{current_user.id}"
    else
      erb :welcome
    end
  end

   
  get '/posts/' do
    if current_user
     redirect "/posts/#{@post.id}"
    end
  end
  
  helpers do 
    def logged_in?
        #!!current_user #true if user is logged in otherwise false
      session.has_key?(:user_id)
    end  
      
    def current_user #returns the user object if current user is logged in
        @current_user ||= User.find(session[:user_id]) if logged_in?
      end
    end
      

    def authorized_to_edit?(post_discussion)
      current_user == post_discussion.user
    end
    
    def redirect_if_not_logged_in
        redirect '/' if !logged_in?
       
    end  
end
