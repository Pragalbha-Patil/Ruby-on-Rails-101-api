module Api
  module V1
    class BooksController < ApplicationController
      def index
        render json: Book.all
      end

      def create
        book = Book.new(books_params)

        if book.save
          render json: book, status: :created
        else
          render json: book.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @book = Book.find(params[:id])
        if @book.present?
          @book.destroy
          render json: {"message": "OK"}, status: 200
        end
      rescue ActiveRecord::RecordNotDestroyed
        render json: {}, status: unprocessable_entity
      end

      private
      def books_params
        params.require(:book).permit(:title, :author)
      end
    end
  end
end