Rails.application.routes.draw do
  devise_for :trainers
  root to: "home#index"
  resources :trainers
  resource :pokemon
  patch '/capture', to: 'pokemons#capture', as: 'capture'
  patch '/damage', to: 'pokemons#damage'
  post 'create', to: 'pokemons#create'
  get 'new', to: 'pokemons#new', as: 'new'
end
