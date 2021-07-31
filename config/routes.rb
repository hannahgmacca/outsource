Rails.application.routes.draw do
  resources :tasks do
    member do
    post 'toggle_favorite', to: "tasks#toggle_favorite"
    end
    resources :comments
  end

  resources :comments
  resources :task_applications
  resources :completed_task
  resources :categories
  resources :cities
  get 'home/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"

  get '/tasks_to_be_approved', to: "home#tasks_to_be_approved"


  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'

  }
end
