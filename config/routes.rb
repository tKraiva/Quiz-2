Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  get '/' => "ideas#index"
  resources :ideas

  resources :users, only: [:new, :create]
  resource :sessions, only: [:new, :destroy, :create]
end
