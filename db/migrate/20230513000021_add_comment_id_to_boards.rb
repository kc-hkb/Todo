class AddCommentIdToBoards < ActiveRecord::Migration[6.0]
  def change
    add_reference :boards, :comment
  end
end
