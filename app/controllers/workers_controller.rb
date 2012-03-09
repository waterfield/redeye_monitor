class WorkersController < ApplicationController
  
  expose :project
  expose(:workers) { project.workers }
  expose :worker
  
  respond_to :json
  
  def index
    respond_with workers
  end
  
  def show
    respond_with worker
  end
end