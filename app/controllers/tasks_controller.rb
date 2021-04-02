# frozen_string_literal: true

##
# Task crud controller
#
class TasksController < ApplicationController
  before_action :set_task, only: %i[show edit update destroy]

  # GET /tasks
  def index
    @tasks = current_user.tasks
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/:id/edit
  def edit; end

  # POST /tasks
  def create
    @task = Task.new(task_params)
    @task.user = current_user
    return redirect_to tasks_url, notice: 'Task was successfully created.' if @task.save

    render :new
  end

  # PATCH/PUT /tasks/:id
  def update
    if @task.update(status: params[:task][:status])
      return redirect_to tasks_url, notice: 'Task was successfully updated.'
    end

    render :edit
  end

  # DELETE /tasks/:id
  def destroy
    @task.destroy
    redirect_to tasks_url, notice: 'Task was successfully destroyed.'
  end

  private

  # set task based on user
  # if task is blank then redirect to tasks index
  def set_task
    @task = current_user.tasks.find_by_id params[:id]
    return redirect_to tasks_url, notice: 'Not Found.' if @task.blank?
  end

  def task_params
    params.require(:task).permit(:name, :description, :status, :deadline)
  end
end
