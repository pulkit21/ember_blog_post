Rails.application.routes.draw do

  namespace :api do
    resources :posts
    get '/search', to: "posts#search"
  end
end
