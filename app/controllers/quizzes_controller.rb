class QuizzesController < AllpicationController
  defore_action :load_quiz, exclude: {:index, :create}

  #layout 'alternative'

  def index
    #render json: Qiuz.all
    @quizzes = Quiz.all
  end

  def create
    render json: Quiz.create(quiz_params)
  end

  def show
    render layout: 'alternative'
    #render json: @quiz
  end

  def update
    render json: @quiz.update(quiz_params)
  end
  
  def destroy
    @quiz.destroy
    render json: { success: "true"}
  end

  def questions
    render json: @quiz.questions
  end

  private

  def load_quiz
    @quiz = Quiz.find(params[id])
  end

  def quiz_params
    params.require(:quiz).permit(:title)
  end
end