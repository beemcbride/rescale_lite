class QuestionAndAnswer < ApplicationRecord
  # In the future we may benefit from an Answerable parent model/controller, 
  # which Recipe and Ingredients (and others like Equipment) would inherit from.
  # For now, Answerable is only indicated in the models.
  belongs_to :answerable, polymorphic: true
  
  # We always need a question to make the record, but we expect the answer to come later. 
  # Ideally we validate that we DON'T have the answer on creation, only the question,
  # and that any edit has ONLY the question OR the answer, not both. 
  # Also ideally, have the create/edit forms only allow the respective information to be edited or submitted.
  validates :question, presence: true
end
