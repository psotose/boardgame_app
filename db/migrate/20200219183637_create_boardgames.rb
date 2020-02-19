class CreateBoardgames < ActiveRecord::Migration[5.2]
  def change
    create_table :boardgames do |t|
      t.string :name
      t.text :rules

      t.timestamps
    end
  end
end
