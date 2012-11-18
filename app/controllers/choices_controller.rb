class ChoicesController < ApplicationController

  def create
    @choice = Choice.new(params[:choice])
    @choice.save
    redirect_to manage_choices_path(@choice.question.poll.edit_key, @choice.question_id)
  end

end