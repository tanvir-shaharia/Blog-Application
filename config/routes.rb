Rails.application.routes.draw do
  resource :session
  resources :posts, only: [:index,:show]
  root "posts#index"
end
