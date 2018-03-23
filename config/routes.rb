Rails.application.routes.draw do
  root "search#index"

  resources :search, only: [:index]
  resources :search_analytics, only: [:index]

  delete "delete-all-search-analytics", to: "search_analytics#delete_all_search_analytics"
end
