Rails.application.routes.draw do
  root "tops#index"
  resources :questions, only: [:new, :show]
  devise_for :users

end
