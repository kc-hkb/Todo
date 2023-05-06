class BoardsController < ApplicationController
  def index
    @boards = Board.all
  end

  def new
    @board = Board.new
  end

  def create
    @board = Board.new(board_params)
    if @board.save
      redirect_to root_path,notice: '保存できたよ'
    else
      flash.now[:error] = '保存できませんでした'
      render :new
    end
  end

  def edit
    @board = Board.find(params[:id])
	end

  def update
    @board = Board.find(params[:id])
		if @board.update(board_params)
			redirect_to root_path,
			notice: '更新できました。'
		else
			flash.now[:error] = '更新できませんでした。'
			render :edit
		end
	end

  private
  def board_params
    params.require(:board).permit(:title, :content)
  end
end