Rails.application.routes.draw do
  root 'static_pages#top'
  
  get '/signup', to: 'users#new' # signup_path,signup_urlヘルパーでusers#newのコントローラの処理を行って/signupのURLをGETする
end
