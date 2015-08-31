Rails.application.routes.draw do

  namespace :api, constriants: { format: :json } do
    get 'seeds' => 'seeds#all'
  end

  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }



  resources :sementes, controller: 'seeds'

  resources :seeds do
  	member do
  		get "like", to: "seeds#like"
  		get "unlike", to: "seeds#unlike"
  	end
  end
  
  resources :terms


  root 'seeds#index'
end
