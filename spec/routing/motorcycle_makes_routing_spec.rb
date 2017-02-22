require 'rails_helper'

RSpec.describe MotorcycleMakesController, type: :routing do
  describe 'routing' do

    it 'routes to #index' do
      expect(:get => '/motorcycle_makes').to route_to('motorcycle_makes#index')
    end

    it 'routes to #show' do
      expect(:get => '/motorcycle_makes/1').to route_to('motorcycle_makes#show', :id => '1')
    end

    it 'routes to #create' do
      expect(:post => '/motorcycle_makes').to route_to('motorcycle_makes#create')
    end

    it 'routes to #update via PUT' do
      expect(:put => '/motorcycle_makes/1').to route_to('motorcycle_makes#update', :id => '1')
    end

    it 'routes to #update via PATCH' do
      expect(:patch => '/motorcycle_makes/1').to route_to('motorcycle_makes#update', :id => '1')
    end

    it 'routes to #destroy' do
      expect(:delete => '/motorcycle_makes/1').to route_to('motorcycle_makes#destroy', :id => '1')
    end

  end
end
