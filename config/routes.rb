Rails.application.routes.draw do
  root to: 'homes#index'
  resources :homes
  devise_for :users

  resources :items do
    resources :item_users
  end
  resources :monsters
  resources :users do
    resources :items
  end
  resources :users do
    resources :item_users
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
