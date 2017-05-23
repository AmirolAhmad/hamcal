Rails.application.routes.draw do
  root 'home#index'

  devise_for :users, path: 'auth', controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    confirmations: 'users/confirmations',
    passwords: 'users/passwords',
    unlocks: 'users/unlocks'
  }
end
