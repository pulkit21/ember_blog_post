Rails.application.routes.draw do

  namespace :api, :defaults => { :format => :json } do
    devise_for :users
    resources :posts
    get '/search', to: "posts#search"
  end
end
