class SessionsController < ApplicationController
    
   def new
       
   end
   
   def create
       user = User.find_by(email: params[:session][:email].downcase)
       if user && user.authenticate(params[:session][:password])
           session[:user_id] = user.id
           flash.now[:success] = "log in Successfull"
           redirect_to user
       else
           flash.now[:danger] = "Login Error, Try again.."
           render 'new'
       end
   end
   
   def destroy
       session[:user_id] = nil
       flash.now[:success] = "You are Logged Out"
       redirect_to root_path
   end
end