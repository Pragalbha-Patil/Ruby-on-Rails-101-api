Rails.application.routes.draw do
  root "articles#index" # by default hit this

  get "/articles", to: "articles#index"

  get "/article/:id", to: "articles#show"
  #The new route is another get route,
  # but it has something extra in its path: :id.
  # This designates a route parameter.
  # A route parameter captures a segment of the request's path,
  # and puts that value into the params Hash,
  # which is accessible by the controller action.
  # For example, when handling a request like GET http://localhost:3000/articles/1,
  # 1 would be captured as the value for :id, which would then be accessible as params[:id]
  # in the show action of ArticlesController.
end
