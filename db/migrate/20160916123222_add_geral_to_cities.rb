class AddGeralToCities < ActiveRecord::Migration[7.0]
  def change
    add_column :cities, :geral, :boolean, default: false
  end
end
