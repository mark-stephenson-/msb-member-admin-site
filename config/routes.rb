Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  resources :bots

  authenticated :user do
    root to: 'user#dashboard', as: :authenticated_root
  end

  root to: redirect("/users/sign_in")

  get "user/dashboard" => "user#dashboard", as: "dashboard"
end
