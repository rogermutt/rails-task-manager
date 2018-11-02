class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
  end

  def create

    # take the params, which they are in the params object 'task'
    # pass them through the accepted "model" >> private
    @task = Task.new(task_params)

    # save task in the DB
    @task.save

    # redirect to /tasks
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :details)
    # i understand the second half, not the first half
  end

end
