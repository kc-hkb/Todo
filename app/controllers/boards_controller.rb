class BoardsController < ApplicationController
  def index
    @boards = Board.all
  end

  def new
    @board = current_user.boards.build
  end

  def show
    @board = Board.find(params[:id])
    @tasks = @board.tasks
    @comment = @board.comments
  end

  def create
    @board = current_user.boards.build(board_params)
    if @board.save
      redirect_to root_path,notice: '保存できたよ'
    else
      flash.now[:error] = '保存できませんでした'
      render :new
    end
  end

  def edit
    @board = current_user.boards.find(params[:id])
	end

  def update
    @board = current_user.boards.find(params[:id])
		if @board.update(board_params)
			redirect_to root_path,
			notice: '更新できました。'
		else
			flash.now[:error] = '更新できませんでした。'
			render :edit
		end
	end

  def destroy
    @board = current_user.boards.find(params[:id])
    @board.destroy!
      redirect_to root_path,
			notice: '削除できました。'
  end

  private
  def board_params
    params.require(:board).permit(:title, :content)
  end
end