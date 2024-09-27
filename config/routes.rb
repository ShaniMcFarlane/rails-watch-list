Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"

  # get "lists", to: "lists#index"
  # get "lists", to: "lists#show", as: "list"

  # get "lists/new", to: "list#new", as: "new_list"
  # post "lists", to: "lists#create"

  # get "lists/:id/bookmarks/new", to: "bookmarks#new", as: "new_list_bookmark"
  # post "lists/:id/bookmarks/", to: "bookmarks#create", as: "list_bookmarks"

  # delete "bookmarks/:id", to: "bookmarks#destroy", as: "bookmark"

  resources :lists, only: [ :index, :show, :new, :create ] do
    resources :bookmarks, only: [ :new, :create ]
  end
  resources :bookmarks, only: :destroy
end




# A user can see all the lists
# GET "lists"
# A user can see the details of a given list and its name
# GET "lists/42"
# A user can create a new list
# GET "lists/new"
# POST "lists"


# GET "lists/42/bookmarks/new"
# POST "lists/42/bookmarks"
# A user can delete a bookmark from a list. How can we make a delete link again?
# DELETE "bookmarks/25"
