# frozen_string_literal: true

Rails.application.routes.draw do
  resource :realmlist, only: :show, controller: :realmlist
  resources :accounts, except: :delete
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
