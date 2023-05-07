class AddTaskIdToUsers < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :task
  end
end
