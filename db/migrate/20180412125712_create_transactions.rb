class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.string :name
      t.string :type
      t.string :asset
      t.integer :amount
      t.integer :user
      t.timestamps
    end
  end
end
