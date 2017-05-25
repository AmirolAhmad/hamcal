Rails.application.routes.draw do

  root 'home#index'
  get "/dashboard" => "dashboard#index"

  devise_for :users, path: 'auth', controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    confirmations: 'users/confirmations',
    passwords: 'users/passwords',
    unlocks: 'users/unlocks'
  }

  namespace :api do
    namespace :v1 do
      post 'user_token' => 'user_token#create'
    end
  end
end
