class CreateAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :accounts do |t|
      t.string :account_number
      t.string :name
      t.integer :account_holder_number
      t.integer :balance
      t.string :address
      t.string :account_type

      t.timestamps
    end
  end
end
