# frozen_string_literal: true

class QAndAComponent < ViewComponent::Base
    def initialize(question_and_answer:, is_brand: false)
      @q_and_a = question_and_answer
      @question = question_and_answer.question
      @answer = question_and_answer.answer
      @show_answer_button = question_and_answer.answer.blank? && is_brand
    end
  end
  