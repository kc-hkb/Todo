class CreateBoards < ActiveRecord::Migration[6.0]
  def change
    create_table :boards do |t|
      t.string :title
      t.text :content
      t.references :comment
      t.timestamps
    end
  end
end
