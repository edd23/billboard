Rails.application.routes.draw do
 root "artists#index"

  get "/artists", to: "artists#index"
  get "/artist/:id", to: "artist#show"
  delete "/artist/:id", to: "artist#destroy"

 resources :artists do
  resources :songs
 end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

