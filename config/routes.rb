Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'home', to 'home&index'

  # member do
  #   get 'questions'
  # end

  resources :quizzes do
    get 'questions',on: :member
  end

  resources :questions
end
