Rails.application.routes.draw do
  # Health and PWA routes
  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Root path route ("/")
  # root "posts#index"

  # Rutas para las listas y bookmarks anidados
  resources :lists do
    resources :bookmarks, only: [:new, :create, :destroy]
  end

  # Rutas para las películas
  resources :movies, only: [:index, :show, :new, :create]
end
