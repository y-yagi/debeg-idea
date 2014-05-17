Rails.application.routes.draw do
  root to: 'welcome#index'
  get '/auth/:provider/callback' => 'sessions#create'
  get '/auth/failure' => 'sessions#failure'
  get '/logout' => 'sessions#destroy', as: :logout

  resources :ideas, only: [:show, :create] do
    resources :comments, only: :create
  end

  namespace :like do
    post '/idea/:id', action: :idea,  constraints: { :id => /\d+/ }, as: :idea
    post '/comment/:id', action: :comment,  constraints: { :id => /\d+/ }, as: :comment
  end

  match '*path' => 'application#error404', via: :all
end
