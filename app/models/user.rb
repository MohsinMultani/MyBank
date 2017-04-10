class User < ApplicationRecord
  rolify

  after_create :assign_default_role, :default_account 

  has_one :account
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def assign_default_role
    self.add_role(:newuser) if self.roles.blank?
  end
  
  def default_account
    
    account = Account.new
    account.account_number = 001
    account.balance = 7896
    account.user_id = self.id
    account.save
  end
end
