class Ingredient < ApplicationRecord
  belongs_to :recipe
  # In the future we may benefit from an Answerable parent model/controller, 
  # which Recipe and Ingredients (and others like Equipment) would inherit from.
  # For now, Answerable is only indicated in the models.
  has_many :question_and_answers, as: :answerable
  enum units:  { g: 0, kg: 1, oz: 2, lbs: 3, ml: 4, l: 5, fl_oz: 6, c: 7, pt: 8, qt: 9, gal: 10 }, _prefix: true
end
