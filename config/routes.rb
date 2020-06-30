Rails.application.routes.draw do
  resources :posts
# resources :posts, only: [:index, :show]
# resources :posts, except: [:destroy]
  get 'static_pages/about'
  root 'home#index'
  get '/home(/:hello)', to: 'home#index'
  get 'posts/page/(:page(.:format))', to: 'posts#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
