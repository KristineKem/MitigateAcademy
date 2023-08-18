class QuestionsController < ApplicationController
  before_action :load_quiz
  before_action :load_question, except: [:create, :new]

  def create
    @question = @quiz.questions.create(question_params)
    if @question.save
      redirect_to quiz_question_path(@quiz, @question)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @question = @quiz.questions.new
  end

  def update
    if @quiz.questions.update(question_params)
      redirect_to quiz_question_path(@path, @question)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def edit

  end



  private

  def load_quiz
    @quiz = Quiz.find(params[:quiz_id])
  end

  def load_question
    @question = @quiz.questions.find(params[:id])
  end 

  def question_params
    params.require(:question).permit(:content, :correct_answer)
  end


end