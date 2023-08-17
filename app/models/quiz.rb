class Quiz < ApplicationRecord
  validates :title, presence: true, uniqueness: true, length: { minimum: 3}
  has_many :questions, dependent: :destroy
end

# == Schema Information
#
# Table name: quizzes
#
#  id          :integer          not null, primary key
#  description :string
#  title       :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_quizzes_on_title  (title) UNIQUE
#
