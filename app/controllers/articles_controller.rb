class ArticlesController < ApplicationController
  def index
    @articles = Article.all # @article is an instance variable, set in controller
    # & article is a local variable for that partial.
    # It is considered a good practice to use only local variables in the partials,
    # as this allows you to reuse them much more easily, including between the views.
  end
end
