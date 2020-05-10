class ContactsController < ApplicationController
  
  # def new
  #   @contact = Contact.new THIS IS PLACED IN THE PAGES CONTROLLER
  # end

  def create
    @contact = Contact.new(contact_params)
    
    if @contact.save
      name = params[:contact][:name]
      email = params[:contact][:email]
      body = params[:contact][:message]
      ContactMailer.contact_email(name, email, body).deliver
      flash[:success] = "Message sent"
      puts "Successful"
      redirect_to root_path
    else
      flash[:danger] = @contact.errors.full_messages.join(", ")
      puts "Unsuccessful"
      render :new
    end
  end
  
  def show
  end
    
  private 

  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end
    
end