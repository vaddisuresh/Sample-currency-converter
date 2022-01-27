Rails.application.routes.draw do
  devise_for :users
  resources :products do 
    collection do
      get 'change_curreny'
    end
  end
  root 'home#home'
end
