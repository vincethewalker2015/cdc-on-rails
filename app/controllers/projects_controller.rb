class ProjectsController < ApplicationController
   
   
   def index
      @projects = Project.all
   end
   
   def new
       @project = Project.new
   end
   
   def create
      @project = Project.new(project_params)
      if @project.save
      flash[:success] = "Project has been created"
      redirect_to project_path(@project) 
      else
      render 'new'
      end
   end
   
   def show
      
   end
   
   private
   
   def project_params
      params.require(:project).permit(:company, :title, :description)
   end
    
end