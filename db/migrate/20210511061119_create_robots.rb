class CreateRobots < ActiveRecord::Migration[6.1]
  def change
    create_table :robots do |t|
      t.string :directions
      t.string :orientation
      t.timestamps
    end
  end
end
