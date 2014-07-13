class CreateTanks < ActiveRecord::Migration
  def change
    create_table :tanks do |t|
      t.string :amount
      t.float :price
      t.string :miles
      t.references :car, index: true

      t.timestamps
    end
  end
end
