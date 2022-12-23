class AddNoteToItemAdvance < ActiveRecord::Migration[7.0]
  def change
    add_column :item_advances, :note, :string
  end
end
