module BookStore
  module Entities
    class Book < Grape::Entity
      expose :isbn
      expose :title
      expose :stock
      expose :created_at
      expose :flows, using: BookStore::Entities::Flow
    end
  end
end