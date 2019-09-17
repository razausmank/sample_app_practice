class AddTokenToCars < ActiveRecord::Migration[5.1]
  def change
    add_column :cars, :token, :string
  end
end
