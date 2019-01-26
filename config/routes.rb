Rails.application.routes.draw do
  root to: 'tasks#new'
  resources :tasks, except: [:edit, :update] do
    collection do
      get :search
    end
    resources :comments, only: [:create]
  end
  
  resource :users, only: [:show]
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
