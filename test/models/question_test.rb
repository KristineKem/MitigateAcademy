# == Schema Information
#
# Table name: questions
#
#  id             :integer          not null, primary key
#  content        :string           not null
#  correct_answer :string           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  quiz_id        :integer
#
# Indexes
#
#  index_questions_on_content  (content) UNIQUE
#  index_questions_on_quiz_id  (quiz_id)
#
# Foreign Keys
#
#  quiz_id  (quiz_id => quizzes.id)
#
require "test_helper"

class QuestionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
