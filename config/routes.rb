Rails.application.routes.draw do
  devise_for :users
  root "home#index"
  get "/actions" => "home#actions"
  post "/deposit" => "home#deposit"
  post "/draw" => "home#draw"
  post "/transfer" => "home#transfer"
  post "/change_status" => "home#change_status"
  get "/extract" => "home#extract"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
