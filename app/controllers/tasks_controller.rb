class TasksController < ApplicationController

  def new
    @task = Board.find(params[:board_id]).tasks.build
  end

  def show
    @board = Board.find(params[:board_id])
    @task = @board.tasks.find(params[:id])
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
    @task = @board.tasks.find(params[:id])
	end

  def update
    @board = Board.find(params[:board_id])
    @task = current_user.tasks.find(params[:id])
		if @task.update(task_params)
			redirect_to board_path(@board),
			notice: '更新できました。'
		else
			flash.now[:error] = '更新できませんでした。'
			render :edit
		end
	end

  def destroy
    @board = Board.find(params[:board_id])
    @task = current_user.tasks.find(params[:id])
    if @task.destroy!
      redirect_to board_path(@board),
			notice: '削除できました。'
    else
      flash.now[:error] = '削除できませんでした。'
      render :show
		end
  end

  private
  def task_params
    params.require(:task).permit(:title, :content, :date, :eyecatch)
  end
end