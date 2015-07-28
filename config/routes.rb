Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }

  resources :seeds do
  	member do
  		put "like", to: "seeds#upvote"
  	end
  end
  
  resources :terms

  root 'seeds#index'
end
