class Account < ApplicationRecord
	belongs_to :user
  has_many :transactions

  resourcify


  def withdrawal(amount)
    self.balance = self.balance - amount.to_i
    self.save
    transaction = Transaction.new
    transaction.account_id = self.id
    transaction.transaction_type = "debit"
    transaction.transaction_amount = amount.to_i
    transaction.save
  end

  def deposit(amount)
    self.balance = self.balance + amount.to_i
    self.save
    transaction = Transaction.new
    transaction.account_id = self.id
    transaction.transaction_type = "credit"
    transaction.transaction_amount = amount.to_i
    transaction.save
  end
end
