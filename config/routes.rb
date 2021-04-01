Rails.application.routes.draw do
  root "articles#index" # by default hit this
  get "/articles", to: "articles#index"
end
