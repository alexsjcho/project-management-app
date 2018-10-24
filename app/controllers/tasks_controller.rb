class TasksController < ApplicationController
  before_action :set_project

  def create
    @task = @project.tasks.create(task_params)
    redirect_to @project
  end

  def destroy
    @task = @project.tasks.find(params[:id])
    if @task.destroy
      flash[:success] = "Task was deleted"
      end
    else
      flash:[:error] = "Task was not deleted"
      redirect_to @project
  end

private

  def set_project
      @project = Project.find(params[:project_id])
  end

  def task_params
    @params[:tasks].permit(:content)
  end

end
