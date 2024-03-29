Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  root to: "lists#home"
  resources :lists, only: [:show, :new, :create, :destroy ] do
    resources :bookmarks, only: [:new, :create]
  end

  resources :bookmarks, only: [ :destroy ]

end

# -- Routes: lists
# root                  GET  /                                        lists#home
#                       POST /lists(.:format)                         lists#create
# new_list              GET  /lists/new(.:format)                     lists#new
# list                  GET  /lists/:id(.:format)
#                       DELETE /lists/:id(.:format)c                   lists#destroy

# -- Routes: bookmarks
# list_bookmarks        POST /lists/:list_id/bookmarks(.:format)       bookmarks#create
# new_list_bookmark     GET  /lists/:list_id/bookmarks/new(.:format)   bookmarks#new
# bookmark              DELETE /bookmarks/:id(.:format)                bookmarks#destroy
