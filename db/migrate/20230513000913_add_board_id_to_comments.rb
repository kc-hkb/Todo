class AddBoardIdToComments < ActiveRecord::Migration[6.0]
  def change
    add_reference :comments, :board
  end
end
