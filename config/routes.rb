Rails.application.routes.draw do
  devise_for :users
  root "tops#index"
  resources :questions, only: [:new, :show]
  devise_scope :user do
    resources :shops, only: [:new, :show,:create]
    resources :addresses, only: [:new, :show, :create]
  end
end
