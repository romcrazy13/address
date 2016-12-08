Rails.application.routes.draw do

  resources :towns
  resources :streets
  resources :buildings

  root 'main#index'
  get 'main/index'

end
