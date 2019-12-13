Rails.application.routes.draw do
  namespace :feed do
    get 'post/index'
  end
  namespace :site do
    get 'users/index'
  end
  namespace :hub do
    get 'login/index'
  end
  namespace :feed do
    resources :home, execpt: [:edit, :index]
    resources :users
    get 'profile', to: 'profile#edit'
    patch 'profile', to: 'profile#update'
    resources :posts
    post '/likes/:post_id', to: 'posts#like', as: "like"
    root 'posts#index'
  end
  namespace :site do
    get  'welcome/index'
    resources :users
    post '/users/register'
  end

  devise_for :users
 
  get 'inicio', to: 'hub/login#index'
  
  root to: 'hub/login#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end