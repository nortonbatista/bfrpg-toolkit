# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Homes' do
  describe 'GET /index' do
    it 'returns http not_found' do
      get '/home/index'
      expect(response).to have_http_status(:not_found)
    end
  end
end
