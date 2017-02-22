require 'rails_helper'

RSpec.describe "MotorcycleMakes", type: :request do
  describe "GET /motorcycle_makes" do
    it "works! (now write some real specs)" do
      get motorcycle_makes_path
      expect(response).to have_http_status(200)
    end
  end
end
