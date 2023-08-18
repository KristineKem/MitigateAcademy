Rails.application.routes.draw do
  get 'home', to: 'home#index'

  resources :quizzes do
    get 'questions', on: :member
  end

  resources :questions
  
end

