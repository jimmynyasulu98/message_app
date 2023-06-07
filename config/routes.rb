Rails.application.routes.draw do
  root 'welcome#index'

  get 'sign_up', to: 'registration#new'
  post 'sign_up', to: 'registration#create'
  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create', as: 'log_in'
  delete 'logout', to: 'session#destroy'
  
  get 'password/reset', to: 'password_resets#new'
  post 'password/reset', to: 'password_resets#create'
  
  get 'password/reset/edit', to: 'password_resets#edit'
  patch 'password/reset/edit', to: 'password_resets#update'

  delete 'messages/:id', to: 'messages#destroy'
  resources :messages
end
