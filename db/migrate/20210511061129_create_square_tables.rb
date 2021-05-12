class CreateSquareTables < ActiveRecord::Migration[6.1]
  def change
    create_table :square_tables do |t|
      t.string :rows
      t.string :columns
      t.timestamps
    end
  end
end
