require "test_helper"

class QuestionAndAnswersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @question_and_answer = question_and_answers(:one)
  end

  test "should get index" do
    get question_and_answers_url
    assert_response :success
  end

  test "should get new" do
    get new_question_and_answer_url
    assert_response :success
  end

  test "should create question_and_answer" do
    assert_difference("QuestionAndAnswer.count") do
      post question_and_answers_url, params: { question_and_answer: { answer: @question_and_answer.answer, question: @question_and_answer.question } }
    end

    assert_redirected_to question_and_answer_url(QuestionAndAnswer.last)
  end

  test "should show question_and_answer" do
    get question_and_answer_url(@question_and_answer)
    assert_response :success
  end

  test "should get edit" do
    get edit_question_and_answer_url(@question_and_answer)
    assert_response :success
  end

  test "should update question_and_answer" do
    patch question_and_answer_url(@question_and_answer), params: { question_and_answer: { answer: @question_and_answer.answer, question: @question_and_answer.question } }
    assert_redirected_to question_and_answer_url(@question_and_answer)
  end

  test "should destroy question_and_answer" do
    assert_difference("QuestionAndAnswer.count", -1) do
      delete question_and_answer_url(@question_and_answer)
    end

    assert_redirected_to question_and_answers_url
  end
end
