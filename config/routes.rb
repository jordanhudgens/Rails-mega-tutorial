Rails.application.routes.draw do

  # customize route for an individual portfolio
  resources :portfolios, except: [:show]
  get 'portfolio/:id', to: 'portfolios#show', as: 'porfolio_show'

  resources :blogs do
    member do
      get :toggle_status
    end
  end

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
