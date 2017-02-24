Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  namespace :user do
    resources :desks, only: [:index]
    # get 'openhouse', to: "desks#openhouse", as: "openhouse"
    resources :clients, except: [:show,:index] do
      resources :events, except: [:show,:index]
    end    
  end

  devise_for :users, controllers: { sessions: "users/sessions", confirmations: 'users/confirmations',
                                    :registrations => 'users/registrations', :passwords => 'users/passwords',
                                    :mailer => 'users/mailer' }

  devise_scope :user do
    get "sign_in", to: "users/sessions#new"
    get "sign_out", to: "users/sessions#destroy"
    get "sign_up", to: "users/registrations#new"
    get "forgot_password", to: "users/passwords#new"
  end

  get 'edit_password', to: "user#edit", as: 'edit_password'
  patch 'update_password', to: "user#update_password", as: 'update_password'
  
  
  get 'edit_profile', to: "user#edit_profile", as: "edit_profile"
  patch 'update_profile', to: "user#update_profile", as: 'update_profile'

  root to: "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
