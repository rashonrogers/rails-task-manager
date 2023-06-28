class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def details
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    task = Task.new(task_params)
    if task.save
      redirect_to tasks_path(@task)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id]) # added this line
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  def delete
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to task_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :details)
  end
end
