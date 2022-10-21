Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users
  # resources :homes, only: :about
  get 'home/about' => 'homes#about'
  resources :books, only: [:index, :create, :show, :edit, :update, :destroy]
  resources :users, only: [:index, :show, :edit, :update]
  # resources :books, only: [:new, :create, :index, :show, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
