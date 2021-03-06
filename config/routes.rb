Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :notebooks
      resources :users
      resources :lectures
    end
  end

  post '/auth', to: 'auth#create'
  post '/signup', to: 'auth#sign_up'
  get '/current_user', to: 'auth#show'

  mount ActionCable.server => '/cable'

end
