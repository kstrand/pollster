class QuestionsController < ApplicationController



  def create
    @question = Question.new(params[:question])
    @question.save
    redirect_to poll_edit_path(@question.poll.edit_key)
  end


end
