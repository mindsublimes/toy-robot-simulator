Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "robot_simulations#new"
  resources :robot_simulations do
    collection do
      get :set_robot
      get :move
    end
  end
end
