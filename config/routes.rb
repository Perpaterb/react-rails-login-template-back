Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users
  
  post 'googlelogin', to: 'users#sign_in'
  put 'googlesign_out', to: 'users#sign_out'

end
