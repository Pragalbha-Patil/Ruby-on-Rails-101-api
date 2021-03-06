require 'rails_helper'
require 'factory_bot_rails'
require 'database_cleaner/active_record'

DatabaseCleaner.strategy = :truncation

describe 'Books API', type: :request do
    describe 'GET /books' do
        before do
            FactoryBot.create(:book, title: 'Ruby', author: 'PSP')
            FactoryBot.create(:book, title: 'Ruby 101', author: 'PSP')
        end
        it 'returns all books' do
            get '/api/v1/books'
            expect(response).to have_http_status(:success)
            expect(JSON.parse(response.body).size).to be > 1
        end
    end

    describe 'POST /books' do
        it 'Create a new book' do
            DatabaseCleaner.clean # truncates the table
            expect {
                post '/api/v1/books', params: {book: {title: 'Nice book', author: 'PSP'}}
            }.to change { Book.count }.from(0).to(1)
            
            expect(response).to have_http_status(:created)
        end
    end

    describe 'DELETE /books/:id' do
        DatabaseCleaner.clean # truncates the table
        book = FactoryBot.create(:book, title: 'Ruby', author: 'PSP')
        
        it 'deletes a book by given ID' do
            expect {
                delete "/api/v1/books/#{book.id}"
            }.to change {Book.count}.from(1).to(0)
            expect(response).to have_http_status(:no_content)
        end
    end
end