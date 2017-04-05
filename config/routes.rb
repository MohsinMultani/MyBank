Rails.application.routes.draw do
  resources :transactions
  get 'transaction/withdraw'

  get 'transaction/deposit'

  #devise_for :users
  resources :accounts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root :to => 'accounts#index'
  
  devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }

  devise_scope :user do
  	get 'sign_in', to: 'devise/sessions#new'
  end


  devise_scope :user do
  	get 'sign_out', to: 'devise/sessions#destroy'
  end
end
