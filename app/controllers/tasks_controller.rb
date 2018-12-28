class TasksController < ApplicationController
  def index
    if params[:sort].nil?
      @tasks = current_user.tasks.order(params[:desc]).reverse
    elsif params[:desc].nil?
      @tasks = current_user.tasks.order(params[:sort])
    end
  end


  def show
    @task = Task.find_by(id: params[:id])
  end

  def edit
    @task = Task.find_by(id: params[:id])
  end

  def update
    @task = Task.find_by(id: params[:id])
    if @task.update(task_params)
      redirect_to tasks_path, success: '保存が完了しました'
    else
      flash.now[:danger] = "保存に失敗しました"
      render :edit
    end
  end

  def date_update
    if !params[:start_date_param].nil?
      task = Task.find_by(id: params[:start_date_param])
      task.update(start_date: Time.now)
      task.update(status: :processing)
    elsif !params[:end_date_param].nil?
      task = Task.find_by(id: params[:end_date_param])
      task.update(end_date: Time.now)
      task.update(status: :done)
    end
    redirect_to tasks_path,success: '日付を登録しました。'
  end

  def new
    @task = Task.new
  end


  def create
    @task = current_user.tasks.new(task_params)
    if @task.save
      redirect_to tasks_path, success: '登録が完了しました'
    else
      flash.now[:danger] = '登録に失敗しました'
      render :new
    end

  end

  def destroy
    @task = Task.find_by(id: params[:id])
    @task.destroy
    redirect_to tasks_path
  end

  private
  def task_params
    params.require(:task).permit(
      :title,
      :description,
      :scheduled_end_date,
      :priority)
  end
end
