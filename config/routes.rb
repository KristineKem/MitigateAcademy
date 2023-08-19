Rails.application.routes.draw do
  get '/', to: redirect('/quizzes')

  get 'home', to: 'home#index'

  resources :quizzes do
    #get 'questions', on: :member
    resources :questions, except: [:index]
  end

  resources :questions
  
end

