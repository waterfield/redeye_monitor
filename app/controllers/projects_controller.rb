class ProjectsController < ApplicationController
  
  expose(:projects) { Project.all }
  expose :project
  
  respond_to :json
  respond_to :html, :only => :show
  
  def index
    respond_with projects
  end
  
  def show
    respond_with project
  end
end