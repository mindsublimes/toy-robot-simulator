class CreatePositions < ActiveRecord::Migration[6.1]
  def change
    create_table :positions do |t|
      t.string :x_coordinate
      t.string :y_coordinate
      t.timestamps
    end
  end
end
