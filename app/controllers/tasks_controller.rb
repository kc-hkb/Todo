class TasksController < ApplicationController

  def new
    @task = Board.find(params[:board_id]).tasks.build
  end

  def show
    @task = Board.find(params[:board_id]).tasks.find(params[:id])
  end

  def create
    @task = Board.find(params[:board_id]).tasks.build(task_params)
    @task.user_id = current_user.id
    if @task.save
      redirect_to board_path(Board.find(params[:board_id])),notice: 'タスクを保存できました'
    else
      flash.now[:error] = '保存できませんでした。'
      render :new
    end
  end

  def edit
    @board = Board.find(params[:board_id])
    @task = @board.tasks.find(params[:task_id])
	end

  private
  def task_params
    params.require(:task).permit(:title, :content, :date)
  end
end