Rails.application.routes.draw do
  resources :items, only: [:index, :create]
  resources :users, only: [:show] do
    get 'items', to: 'items#user_items'
  end

end
