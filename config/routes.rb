Rails.application.routes.draw do
  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    sign_up: 'register'
  }
  root 'root#index'

  # Defines the root path route ("/")
  # root "articles#index"
end
