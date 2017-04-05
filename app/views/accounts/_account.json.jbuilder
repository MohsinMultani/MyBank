json.extract! account, :id, :account_number, :name, :account_holder_number, :balance, :address, :account_type, :created_at, :updated_at
json.url account_url(account, format: :json)
