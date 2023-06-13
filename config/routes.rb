Rails.application.routes.draw do

  root 'messages#index'
  get 'sign_up', to: 'registration#new'
  post 'sign_up', to: 'registration#create'
  get 'sign_in', to: 'session#new'
  post 'sign_in', to: 'session#create', as: 'log_in'
  delete 'logout', to: 'session#destroy'
  
  get 'password/reset', to: 'password_reset#new'
  post 'password/reset', to: 'password_reset#create'

  get 'password/reset/edit', to: 'password_reset#edit'
  patch 'password/reset/edit', to: 'password_reset#update'

  delete 'messages/:id', to: 'messages#destroy'
 
  resources :messages do
     resources :comments
  end      

  default_url_options :host => "https://mail.google.com/"
end
