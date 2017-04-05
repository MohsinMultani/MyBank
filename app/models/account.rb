class Account < ApplicationRecord
	belongs_to :user, optional: true,  foreign_key: "user_id"
end
