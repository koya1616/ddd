Rails.application.routes.draw do
  devise_for :admins, controllers:{
    registrations: "admins/registrations",
    sessions: "admins/sessions"
  }
  devise_for :drivers, controllers:{
    registrations: "drivers/registrations",
    sessions: "drivers/sessions"
  }
  devise_scope :drivers do
    post "driver/guest_sign_in", to: "drivers/sessions#new_guest"
  end
  devise_for :ad_clients, controllers:{
    registrations: "ad_clients/registration",
    sessions: "ad_clients/session"
  }
  devise_scope :ad_clients do
    post "ad_clients/guest_sign_in", to: "ad_clients/sessions#new_guest"
  end
  
  root :to => "homes#index"
  get "homes/index"
  get "homes/about" 
  
  resources :admins, only:[:index]
  
  namespace :admins do
    resources :ad_clients, only: [:index, :show, :update]
    resources :driver, only: [:index, :show, :update]
    resources :genres, only: [:index, :create, :edit, :update, :destroy]
    resources :contacts, only: [:index, :show]
  end
  
  resources :contacts, only:[:new, :create, :index, :show, :update] do
    post :confirm, action: :confirm_new, on: :new
  end

  resources :ads, only:[:index, :show] do
    resources :chats, only: [:index, :create]
    resources :rooms, only: [:index, :show, :create]
    member do
      get :genre_search
      get :favorite_search
      get :apply
    end
    resources :favorites, only: [:create, :destroy]
  end
  
end
