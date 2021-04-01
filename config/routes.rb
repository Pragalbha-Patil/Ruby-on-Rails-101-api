Rails.application.routes.draw do
  root "articles#index" # by default hit this
  resources :articles
end
