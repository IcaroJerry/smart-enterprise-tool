class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.float :price
      t.text :description
      t.date :date
      t.date :deadline
      t.string :client

      t.timestamps null: false
    end
  end
end
