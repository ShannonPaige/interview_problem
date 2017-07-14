Rails.application.routes.draw do

  root to: "users#index"

  resources :users, only: [:index, :show]

  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      resources :users, only: [:create]
    end
  end
end
