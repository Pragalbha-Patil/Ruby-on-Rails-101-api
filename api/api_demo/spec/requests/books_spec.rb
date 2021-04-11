require 'rails_helper'
require 'spec_helper'

describe 'Projects API', type: :request do
  context 'GET /api/v1/1' do
    it 'returns 200' do
      get '/api/v1/books'
      expect(response).to_have_http_status(:success)
    end
  end
end