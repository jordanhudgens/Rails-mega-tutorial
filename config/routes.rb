Rails.application.routes.draw do
  resources :portfolios
  resources :blogs

  # default...
  # get 'pages/home'
  # get 'pages/about'
  # get 'pages/contact'

  # customized...controller#action, as in 'rake routes' listing.
  root to: 'pages#home'

  get 'about-me', to: 'pages#about'
  get 'contact', to: 'pages#contact'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

# AK: when 'pages/home' route is hit, the home action in the pages controller
