Rails.application.routes.draw do
  devise_for :admins, controllers:{
    registrations: "admins/registration",
    sessions: "admins/session"
  }
  devise_for :drivers, controllers:{
    registrations: "drivers/registration",
    sessions: "drivers/session"
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
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
