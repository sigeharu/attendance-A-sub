Rails.application.routes.draw do
  root 'static_pages#top'
  get '/signup', to: 'users#new' # signup_path,signup_urlヘルパーでusers#newのコントローラの処理を行って/signupのURLをGETする

  # ログイン機能
  get     '/login', to: 'sessions#new'
  post    '/login', to: 'sessions#create'
  delete  '/logout', to: 'sessions#destroy'
  
  resources :users # 基本的にこの一行でusers_controllerをカバーできる
end