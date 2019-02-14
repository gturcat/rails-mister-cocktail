class RemoveQuantityFromDoses < ActiveRecord::Migration[5.2]
  def change
    remove_column :doses, :quantity, :integer
  end
end
