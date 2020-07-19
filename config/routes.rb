Rails.application.routes.draw do
  root 'static_pages#top'
  
  get '/signup', to: 'users#new' # signup_path,signup_urlヘルパーでusers#newのコントローラの処理を行って/signupのURLをGETする
  resources :users # 基本的にこの一行でusers_controllerをカバーできる
end