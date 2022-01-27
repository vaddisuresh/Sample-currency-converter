class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.float :price
      t.timestamps
    end
    add_column :products, :user_id, :integer
  end
end
