# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Registrations' do
  describe 'GET /new' do
    it 'returns http success' do
      get '/registrations/new'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /create' do
    it 'returns http success' do
      post '/registrations'
      expect(response).to have_http_status(:success)
    end
  end
end
