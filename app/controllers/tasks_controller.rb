class TasksController < ApplicationController

  def new
    @task = Board.find(params[:board_id]).tasks.build
  end

  def create
    @task = Board.find(params[:board_id]).tasks.build(task_params)
    binding.pry
    if @task.save
      redirect_to board_path(board),notice: 'タスクを保存できました'
    else
      flash.now[:error] = '保存できんかったわ'
      render :new
    end
  end

  private
  def task_params
    params.require(:task).permit(:title, :content, :date)
  end
end