class CreatePrices < ActiveRecord::Migration[5.1]
  def change
    create_table :prices do |t|
      t.references :product, foreign_key: true
      t.string :currency
      t.string :value

      t.timestamps
    end
  end
end
