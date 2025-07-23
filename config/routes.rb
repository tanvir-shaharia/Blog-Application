Rails.application.routes.draw do
  resource :session
  resources :posts, only: [:index, :show]
  root "posts#index"
  namespace :admin do
    resources :posts, only: [:new, :create]
  end
end
