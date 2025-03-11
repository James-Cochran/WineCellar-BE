require 'rails_helper'

RSpec.describe "GET /api/v1/wines", type: :request do
  describe "when wines exist" do
    before do
      create_list(:wine, 3)
    end

    it "returns all wines" do
      get "/api/v1/wines"

      expect(response).to have_http_status(:success)

      json_response = JSON.parse(response.body, symbolize_names: true)

      expect(json_response).to have_key(:data)
      expect(json_response[:data]).to be_an(Array)
      expect(json_response[:data].length).to eq(3)

      json_response[:data].each do |wine|
        expect(wine).to have_key(:id)
        expect(wine[:id]).to be_a(String)
      
        expect(wine).to have_key(:type)
        expect(wine[:type]).to eq("wine")
      
        expect(wine).to have_key(:attributes)
        expect(wine[:attributes]).to have_key(:name)
        expect(wine[:attributes][:name]).to be_a(String)
      
        expect(wine[:attributes]).to have_key(:wine_type)
        expect(wine[:attributes][:wine_type]).to be_a(String)
      
        expect(wine[:attributes]).to have_key(:rating)
        expect(wine[:attributes][:rating]).to be_a(Integer)
      
        expect(wine[:attributes]).to have_key(:notes)
        expect(wine[:attributes][:notes]).to be_a(String).or be_nil
      end
    end
  end

  describe "when no wines exist" do
    it "returns an empty array" do
      get "/api/v1/wines"

      json_response = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:success)
      expect(json_response[:data]).to be_an(Array)
      expect(json_response[:data]).to be_empty
    end
  end
end