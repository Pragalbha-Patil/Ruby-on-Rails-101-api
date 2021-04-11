require 'rails_helper'
require 'factory_bot_rails'

describe 'Books API', type: :request do
    it 'returns all books' do
        
        FactoryBot.create(:book, title: 'Ruby', author: 'PSP')
        FactoryBot.create(:book, title: 'Ruby 101', author: 'PSP')
        
        get '/api/v1/books'
        
        expect(response).to have_http_status(:success)
        expect(JSON.parse(response.body).size).to eq(2)
    end
end