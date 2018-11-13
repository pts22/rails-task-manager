class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

   def show
    @tasks = Task.find(params[:id])
  end

  def new
    @tasks = Task.new
  end

  def create
    @tasks = Task.new(task_params)
    @tasks.save

    redirect_to tasks_path(@tasks)
  end

  def edit
    @tasks = Task.find(params[:id])
  end

  def update
    @tasks = Task.find(params[:id])
    @tasks.update(user_params)

    redirect_to tasks_path(@tasks)
  end

  def destroy
    @tasks = Task.find(params[:id])
    @tasks.destroy

    redirect_to tasks_path
  end


  private

  def task_params
    params.require(:task).permit(:title, :details)
  end

  def user_params
    params.require(:task).permit(:title, :details, :completed)
  end

end
