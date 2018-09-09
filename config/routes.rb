Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'registrations'
  }, path_names: {
    sign_in: 'sign-in',
    sign_up: 'sign-up'
  }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'issues#index'

  resources :users,   only: [:index]
  resources :issues,  only: [:index, :new, :create]

  namespace :api do
    namespace :v1 do
      resources :issues, only: [:index]
    end
  end
end
