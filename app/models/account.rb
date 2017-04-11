class Account < ApplicationRecord
	belongs_to :user
  has_many :transactions

  resourcify

  validates_numericality_of :balance, :only_integer => true

  def withdrawal(amount)

    if amount.to_i > 0
      if self.balance >= amount.to_i

        self.balance = self.balance - amount.to_i
        self.save
        transaction = Transaction.new
        transaction.account_id = self.id
        transaction.transaction_type = "debit"
        transaction.transaction_amount = amount.to_i
        transaction.save
      else
        errors.add(:balance, "cannot wtithdraw Amount. Please deposit amount first..!")
        false
      end
    else
       errors.add(:balance, "value is Not valid, Please Insert The Valid value..!")
       false
    end

  end

  def deposit(amount)

    if amount.to_i > 0 
      self.balance = self.balance + amount.to_i
      self.save
      transaction = Transaction.new
      transaction.account_id = self.id
      transaction.transaction_type = "credit"
      transaction.transaction_amount = amount.to_i
      transaction.save
    else
      errors.add(:balance, "Cannot Deposit Negative Value, Please Insert Positive Value..!")
      false
    end
  end
end
