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
  
  get '/help' => 'static_pages#help'
  get '/about' => 'static_pages#about'
  get '/contact' => 'static_pages#contact'
  
  get '/users' => 'users#index'
  get '/signup' =>  'users#new'
  get '/signin' =>  'sessions#new'
  post '/signout' =>  'sessions#destroy'

end
