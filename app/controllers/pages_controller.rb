class PagesController < ApplicationController 
   
   
   
   def home
      @contact = Contact.new
      @details = Detail.all
      @projects = Project.all
   end
   
   
   
   
    
end