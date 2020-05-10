class DetailsController < ApplicationController
  #before_action :require_user

  def index
    @details = Detail.all
  end

  def new
    @detail = Detail.new
  end

  def create
    @detail = Detail.new(detail_params)
    @detail.user = current_user
    if @detail.save
      flash[:success] = "Owner details created"
      redirect_to detail_path(@detail) 
    else
      render 'new'
    end
  end

  def show
    @detail = Detail.find(params[:id])
  end

  def edit
    @detail = Detail.find(params[:id])
  end

  def update
    @detail = Detail.find(params[:id])
    if @detail.update(detail_params)
      flash.now[:success] = "Details updated"
      redirect_to detail_path(@detail)
    else
      render 'edit'
    end
  end

  def destroy
    @detail = Detail.find(params[:id])
    @detail.destroy
    flash[:success] = "Details have been Deleted"
    redirect_to details_path
  end

  private

  def detail_params
    params.require(:detail).permit(:name, :employee_name, :title, :description, :picture)
  end 
end