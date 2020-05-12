Rails.application.routes.draw do
  devise_for :users
  root "home#index"
  get "/actions" => "home#actions"
  get "/deposit" => "home#deposit"
  get "/draw" => "home#draw"
  get "/transfer" => "home#transfer"
  get "/change_status" => "home#change_status"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
