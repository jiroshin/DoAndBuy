Rails.application.routes.draw do
  root to: 'tasks#new'
  resources :tasks, except: [:edit, :update] do
    collection do
      get :search
    end
    resources :comments, only: [:create]
  end
  post   '/like/:task_id' , to: 'likes#like',   as: 'like'
  delete '/like/:task_id' , to: 'likes#unlike', as: 'unlike'

  devise_for :users
  resources :users, only: [:show]
end
