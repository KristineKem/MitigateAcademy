class QuizzesController < ApplicationController
  before_action :load_quiz, except: [:index, :create, :new]

  #layout 'alternative'

  def index
    #render json: Qiuz.all
    @quizzes = Quiz.all
  end

  def create
    @quiz = Quiz.create(quiz_params)
    if @quiz.save
      redirect_to @quiz, notice: 'Horray! Toy created a Quiz!'
    else
      flash.now.alert = 'Something went wrong...'
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @quiz = Quiz.new
  end

  def show
    #render layout: 'alternative'
    #render json: @quiz
  end

  def update
    if params[:add_question]
      @quiz.assign_attributes quiz_params
      @quiz.questions.build
      render :edit, status: 200
    elsif @quiz.update(quiz_params)
        redirect_to @quiz
    else 
      render :edit, status: :unprocessable_entity
    end
  end

  def edit

  end
  
  def destroy
    @quiz.destroy
    redirect_to quizzes_path
  end

  def questions
    render json: @quiz.questions
  end

  private

  def load_quiz
    @quiz = Quiz.find(params[:id])
  end

  def quiz_params
    params.require(:quiz).permit(:title, :description, :image, questions_attributes: [:id, :content, :correct_answer, :_destroy])
  end
end