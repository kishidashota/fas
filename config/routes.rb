Rails.application.routes.draw do
  root "tops#index"
  resources :questions, only: [:new, :show]
end
