TrackYoGas::Application.routes.draw do
  devise_for :users

  resources :cars
  resources :tanks
  
  root 'session#index'
end
