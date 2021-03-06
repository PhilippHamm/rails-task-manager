class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    task = Task.create(task_params)
    redirect_to tasks_path
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    if params['completed'] == 1
      params['completed'] = true
    elsif params['completed'] == 1
      params['completed'] = false
    end
    task = Task.find(params[:id])
    task.update(task_params)
    redirect_to tasks_path
  end

  def delete
    task = Task.find(params[:id])
    task.delete
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
