class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :make
      t.string :brand
      t.string :color
      t.string :year
      t.references :user, index: true

      t.timestamps
    end
  end
end
