class CreateCities < ActiveRecord::Migration[7.0]
  def change
    create_table :cities do |t|
      t.string :name, limit: 100, null: false

      t.timestamps null: false
    end
    add_index :cities, :name, unique: true
  end
end
