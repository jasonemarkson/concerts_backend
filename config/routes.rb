Rails.application.routes.draw do
  resources :concerts
  resources :artists do
      resources :concerts, only: [:index, :show]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
