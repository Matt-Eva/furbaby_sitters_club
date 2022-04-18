Rails.application.routes.draw do
  
  resources :pets
  resources :appointments
  resources :sitters
  resources :clients
  # Routing logic: fallback requests for React Router.
  # Leave this here to help deploy your app later!
  get "*path", to: "fallback#index", constraints: ->(req) { !req.xhr? && req.format.html? }
end
