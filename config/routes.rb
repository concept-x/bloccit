Rails.application.routes.draw do
  resources :posts

#if no 'get' specified, no views display b/c app won't know what to 'get'.
  resources :welcome

  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
