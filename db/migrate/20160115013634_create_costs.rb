class CreateCosts < ActiveRecord::Migration
  def change
    create_table :costs do |t|
      t.float :value
      t.integer :installments
      t.date :date
      t.text :description
      t.boolean :isfixed
      t.boolean :isespecial
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
