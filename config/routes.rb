Rails.application.routes.draw do
  resources :seeds

  root 'seeds#index'
end
