class AddAddressToCocktail < ActiveRecord::Migration[6.0]
  def change
    add_column :cocktails, :address, :string
  end
end
