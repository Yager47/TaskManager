class Api::ProjectsController < ApplicationController

  def index
    respond_with(Project.all)
  end

  def show
    respond_with(Project.find(params[:id]))
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      respond_to do |format|
        format.json { render json: @project }
      end
    end
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      respond_to do |format|
        format.json { render json: @project }
      end
    end
  end

  def destroy
    respond_with(Project.destroy(params[:id]))
  end

  private 
    def project_params
      params.require(:project).permit(:title)
    end
end
