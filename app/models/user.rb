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
    account.account_number = rand.to_s[2..11]
    account.balance = 0
    account.user_id = self.id
    account.account_type = "saving"
    account.save
  end
end
