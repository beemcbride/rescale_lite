require "application_system_test_case"

class QuestionAndAnswersTest < ApplicationSystemTestCase
  setup do
    @question_and_answer = question_and_answers(:one)
  end

  test "visiting the index" do
    visit question_and_answers_url
    assert_selector "h1", text: "Question and answers"
  end

  test "should create question and answer" do
    visit question_and_answers_url
    click_on "New question and answer"

    fill_in "Answer", with: @question_and_answer.answer
    fill_in "Question", with: @question_and_answer.question
    click_on "Create Question and answer"

    assert_text "Question and answer was successfully created"
    click_on "Back"
  end

  test "should update Question and answer" do
    visit question_and_answer_url(@question_and_answer)
    click_on "Edit this question and answer", match: :first

    fill_in "Answer", with: @question_and_answer.answer
    fill_in "Question", with: @question_and_answer.question
    click_on "Update Question and answer"

    assert_text "Question and answer was successfully updated"
    click_on "Back"
  end

  test "should destroy Question and answer" do
    visit question_and_answer_url(@question_and_answer)
    click_on "Destroy this question and answer", match: :first

    assert_text "Question and answer was successfully destroyed"
  end
end
