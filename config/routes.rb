Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :publishers, only: :show
      resources :shops, only: :show
    end
  end
end