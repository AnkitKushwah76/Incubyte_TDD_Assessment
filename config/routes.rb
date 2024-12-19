Rails.application.routes.draw do
  resources :string_calculators, only: [:new, :create]
  root 'string_calculators#new'
end