Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :schools, only: [:show, :index]
  root to: 'page#home'
end
