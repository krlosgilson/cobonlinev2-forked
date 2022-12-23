class AddStatusToAdvances < ActiveRecord::Migration[7.0]
  def change
    add_column :advances, :status, :integer, null: false, default: 0
  end
end
