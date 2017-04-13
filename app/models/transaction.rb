class Transaction < ApplicationRecord
  belongs_to :account
  paginates_per 5
  
end
