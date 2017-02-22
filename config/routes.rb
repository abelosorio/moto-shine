Rails.application.routes.draw do
  resources :motorcycle_makes do
    resources :motorcycle_models
  end
end
