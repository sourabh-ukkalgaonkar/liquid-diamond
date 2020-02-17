class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :model
      t.string :brand
      t.integer :year
      t.decimal :ram
      t.decimal :external_storage

      t.timestamps
    end
  end
end
