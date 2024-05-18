class CreateQuestionAndAnswers < ActiveRecord::Migration[6.0]  # ensure correct version number
  def change
    create_table :question_and_answers do |t|
      t.string :question
      t.text :answer
      t.references :answerable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
