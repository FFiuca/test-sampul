Rails.application.routes.draw do
  get "/articles", to: "articles#index"
  get "/articles/:id", to: "articles#show"

  get "articles/new", to: "articles#new"

  get "coba", to: "chat#coba"
  post "roomCreate", to: "chat#roomCreate", defaults: { format: :json }
  post "addChat", to: "chat#addChat"

  post "getChatByRoom", to: "chat#getChatByRoom", defaults: { format: :json }

  # resources :articles // to use resources like laravel

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
