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
  
  match '/help', to: 'static_pages#help'
  match '/about', to:'static_pages#about'
  match '/contact', to: 'static_pages#contact'
  
  match '/users', to: 'users#index'
  match '/signup', to: 'users#new'
  match '/signin', to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete

end
