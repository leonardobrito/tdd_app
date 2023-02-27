Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :customers, only: %i[index new create]

  # Defines the root path route ("/")
  root 'welcome#index'
end
