Rails.application.routes.draw do
  root "recipes#index"

  resources :users

  resources :recipes do
    resources :question_and_answers, only: [:new, :create]
  end

  resources :ingredients do
    resources :question_and_answers, only: [:new, :create]
  end
  
  resources :question_and_answers, only: [:index, :show, :edit, :update, :destroy]

  post "/set_current_user", to: "application#set_current_user"
  
end
