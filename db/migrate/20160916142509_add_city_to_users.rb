class AddCityToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :city, index: true, foreign_key: true
  end
end
