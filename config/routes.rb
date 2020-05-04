Rails.application.routes.draw do
  devise_for :users
  root "tops#index"
  resources :questions, only: [:new, :show]
  devise_scope :user do
    resources :shops, only: [:new, :show]
    resources :addresses, only: [:new, :show]
  end
end
