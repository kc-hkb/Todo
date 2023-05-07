class AddTaskIdToBoards < ActiveRecord::Migration[6.0]
  def change
    add_reference :boards, :task
  end
end
