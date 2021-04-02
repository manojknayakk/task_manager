Rails.application.routes.draw do
  root to: 'tasks#index'

  resources :tasks, except: :show
  devise_for :users
end
