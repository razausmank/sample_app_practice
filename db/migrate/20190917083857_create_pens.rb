class CreatePens < ActiveRecord::Migration[5.1]
  def change
    create_table :pens do |t|
      t.string :name
      t.string :password

      t.timestamps
    end
  end
end
