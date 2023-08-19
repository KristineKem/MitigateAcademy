class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.string :content, null: false, index: {unique: true}
      t.string :correct_answer, null: false
      t.references :quiz, foreign_key: true
      t.timestamps
    end
  end
end
