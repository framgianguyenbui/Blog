Blog::Application.routes.draw do
  root to: 'static_pages#home'
  resources :users do
    member do
      get :following, :followers
    end
  end


  resources :sessions, only: [:new, :create, :destroy]
  resources :entries,  only: [:show, :create, :destroy]
  resources :comments,  only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
  
  get '/help', to: 'static_pages#help'
  get '/about', to:'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  
  get '/users', to: 'users#index'
  get '/signup', to: 'users#new'
  get '/signin', to: 'sessions#new'
  post '/signout', to: 'sessions#destroy', via: :delete

end
