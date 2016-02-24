Rails.application.routes.draw do

  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)
  resources :bookmarks

  devise_for :users

  devise_scope :user do
    post "/devsie-login" => "sessions#create"
    delete "/devsie-logout" => "sessions#destroy"
    post "/devsie-register" => "users#create"
  end

  root to: "home#index"
end
