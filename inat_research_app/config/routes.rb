Rails.application.routes.draw do
  root 'research_articles#index'
  resources :research_articles, only: [:index, :show, :edit, :update]
end