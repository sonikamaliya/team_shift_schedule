Rails.application.routes.draw do

  get 'shifts/new'
  get 'shifts/create'
  get 'shifts/index'
  devise_for :users
  root :to => "pages#home"

  resources :teams do
    member do
      get :get_member
      post :team_member
    end
  end
  get 'pages/home'
  get 'pages/teams'
  get 'pages/shift'
  get 'pages/tm_members'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
