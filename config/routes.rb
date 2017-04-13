Rails.application.routes.draw do
  
    devise_for :users    #, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'transactions/withdraw'

  get 'transactions/deposit'
  
  post 'transactions/do_withdraw'

  post 'transactions/do_deposit'
  
  root :to => 'accounts#show'

  #devise_for :users
  resources :accounts do
    resources :transactions
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  

  devise_scope :user do
  	get 'sign_in', to: 'devise/sessions#new'
  end


  devise_scope :user do
  	get 'sign_out', to: 'devise/sessions#destroy'
  end
end
