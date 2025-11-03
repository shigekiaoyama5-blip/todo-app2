class TasksController < ApplicationController
  before_action :authenticate_user!
  def index
    @tasks =  Task.all #current_user.tasks
  end

  def show
     @task =Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params) #current_user.tasks.new task_params
    if @task.save
      redirect_to task_path(@task), notice: 'Saved'
    else
      flash.now[:error] = 'Failed save'
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = target_task params[:id]
    @task.update(task_params)
    redirect_to @task
  end

  private
  def target_task task_id
    current_user.tasks.where(id: task_id).take
  end

  def task_params
    params.require(:task).permit(:title, :description)
  end
end
