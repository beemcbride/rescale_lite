class Recipe < ApplicationRecord
  has_many :ingredients
  # In the future we may benefit from an Answerable parent model/controller, 
  # which Recipe and Ingredients (and others like Equipment) would inherit from.
  # For now, Answerable is only indicated in the models.
  has_many :question_and_answers, as: :answerable
end
