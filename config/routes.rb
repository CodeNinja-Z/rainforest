Rails.application.routes.draw do

  resources :products do
    resources :reviews, only: [:show, :create, :destroy]
  end
  resources :users, only: [:new, :create]
  resources(:sessions, {only: [:new, :create, :destroy]})
                       #key   #symbol
  # resources :sessions, only: [:new, :create, :destroy]
  # Above line is same as the following:
  # resources(:sessions, {:only => [:new, :create, :destroy]})
  
  # symbol itself can be the value to another key in a hash
  # the whole thing only: ... :destroy is a hash,
  # only is the key, the valus is the followed-up array 

end
