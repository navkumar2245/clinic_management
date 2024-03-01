Rails.application.routes.draw do

    devise_for :users, controllers: {
      sessions: 'users/sessions'
    }
    resources :clinics do
      resources :users, only: [:new, :create]
      resources :appointments do 
        patch 'mark_doctor', on: :member
        patch 'mark_medicine', on: :member
        patch 'mark_completed', on: :member
        get 'add_prescription', on: :member
        post 'save_prescription', on: :member

      end
    end
  
    root 'appointments#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
