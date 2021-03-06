Rails.application.routes.draw do
  resources :products do
    collection do
      get :export
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  root 'products#index'
end
