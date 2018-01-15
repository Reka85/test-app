class RenameProductsAttributesToFeatures < ActiveRecord::Migration[5.1]
  def change
    rename_column :products, :attributes, :features
  end
end
