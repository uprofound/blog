Rails.application.routes.draw do
  devise_for :users
  resources :posts
# resources :posts, only: [:index, :show]
# resources :posts, except: [:destroy]
  resources :users
  root 'home#index'
  get '/home(/:hello)', to: 'home#index'
  get '/posts/page/(:page(.:format))', to: 'posts#index'
  get '/about', to: 'about#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
