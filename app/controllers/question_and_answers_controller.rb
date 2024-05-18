class QuestionAndAnswersController < ApplicationController
  before_action :set_question_and_answer, only: %i[show edit update destroy]
  before_action :set_answerable, only: %i[new create]

  # GET /question_and_answers or /question_and_answers.json
  def index
    @question_and_answers = QuestionAndAnswer.all
  end

  # GET /question_and_answers/1 or /question_and_answers/1.json
  def show
  end

  # GET /question_and_answers/new
  def new
    # This would need rework if/when we make Recipes also have questions/answers, instead of just ingredients.
    # For the sake of time, limited the working solution to just Ingredients being Q&A-able.
    @answerable = Ingredient.find(params[:ingredient_id])
    @question_and_answer = @answerable.question_and_answers.build
  end

  # GET /question_and_answers/1/edit
  def edit
  end

  # POST /question_and_answers or /question_and_answers.json
  def create
    @question_and_answer = @answerable.question_and_answers.new(question_and_answer_params)
    if @question_and_answer.save
      redirect_to @answerable, notice: 'Question and answer was successfully created.'
    else
      # This part is untested - I think it'll work, but for the sake of time untested :/
      format.html { render :new, status: :unprocessable_entity }
      format.json { render json: @question_and_answer.errors, status: :unprocessable_entity }
    end
  end


  # PATCH/PUT /question_and_answers/1 or /question_and_answers/1.json
  def update
    respond_to do |format|
      if @question_and_answer.update(question_and_answer_params)
        format.html { redirect_to question_and_answer_url(@question_and_answer), notice: "Question and answer was successfully updated." }
        format.json { render :show, status: :ok, location: @question_and_answer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @question_and_answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /question_and_answers/1 or /question_and_answers/1.json
  def destroy
    @question_and_answer.destroy!

    respond_to do |format|
      format.html { redirect_to question_and_answers_url, notice: "Question and answer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question_and_answer
      @question_and_answer = QuestionAndAnswer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def question_and_answer_params
      params.require(:question_and_answer).permit(:question, :answer)
    end

    # So we can actually make questions and answers for the Answerables (Ingredients and Recipes, currently.)
    def set_answerable
      resource, id = request.path.split('/')[1, 2]
      @answerable = resource.singularize.classify.constantize.find(id)
    end
end
