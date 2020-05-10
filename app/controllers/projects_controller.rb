class ProjectsController < ApplicationController
   before_action :require_user, except: [:show]
   
   def index
      @projects = Project.all
   end
   
   def new
       @project = Project.new
   end
   
   def create
      @project = Project.new(project_params)
      @project.user = current_user
      if @project.save
      flash[:success] = "Project has been created"
      redirect_to project_path(@project) 
      else
      flash[:danger] = "Error! Try again!"
      render 'new'
      end
   end
   
   def show
      @project = Project.find(params[:id])
   end
   
   def edit
      @project = Project.find(params[:id])
   end
   
   def update
      @project = Project.find(params[:id])
      if @project.update(project_params)
         flash.now[:success] = "Project has been updated"
         redirect_to project_path(@project)
      else
         render 'edit'
      end
   end

   def destroy
      @project = Project.find(params[:id])
      @project.destroy
      flash[:success] = "Project has been Deleted"
      redirect_to projectss_path
    end
   
   private
   
   def project_params
      params.require(:project).permit(:company, :title, :description)
   end
    
end