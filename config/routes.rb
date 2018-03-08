Rails.application.routes.draw do
  get 'welcome/index'
#if no 'get' specified, no views display b/c app won't know what to 'get'.
  get 'welcome/about'
    
  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
