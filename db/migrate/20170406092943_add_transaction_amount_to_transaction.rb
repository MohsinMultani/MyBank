class AddTransactionAmountToTransaction < ActiveRecord::Migration[5.0]
  def change
    add_column :transactions, :transaction_amount, :integer
  end
end
