class AddDistrictToClient < ActiveRecord::Migration[7.0]
  def change
    add_column :clients, :district, :string
  end
end
