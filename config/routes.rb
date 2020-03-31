Rails.application.routes.draw do
  devise_for :accounts
  resources :board_orders
  resources :board_users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'board_orders#index'
  resources :board_orders do
    member do
      get 'send_image'
    end
  end

  resources :board_orders do
    post 'add' => 'favorites#create'
    delete '/add' => 'favorites#destroy'
  end
end
