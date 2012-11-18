class PollsController < ApplicationController
  def index
    @polls = Poll.all
  end

  def new
    @poll = Poll.new
  end

  def create
    @poll = Poll.new(params[:poll])
    @poll.save
    redirect_to poll_edit_path(@poll.edit_key)
  end

  def edit
    @poll = Poll.find_by_edit_key(params[:edit_key])
    @questions = @poll.questions


    #find the poll as it comes in through the custom routes
    #find the poll via the edit key in the params
    #make sure to account for any exceptions
  end


  def update
    @poll = Poll.find_by_edit_key(params[:edit_key])
    questions = params[:poll].delete(:questions_attributes)
    @poll.update_attributes!(params[:poll])
    questions.each_value do |question|
      @question = Question.find(question[:id])
      if question.delete(:_destroy).to_i == 1
        @question.destroy
      else
        @question.update_attributes!(question)
      end
    end
    redirect_to poll_edit_path(@poll.edit_key)
  end

  def destroy
    @poll = Poll.find(params[:id])
    @poll.destroy
    redirect_to root_path
  end

  def show
    @poll = Poll.find_by_share_key(params[:share_key])
    @questions = @poll.questions
  end


  def show_responses
    @poll = Poll.find_by_edit_key(params[:edit_key])
    @questions = @poll.questions
  end


  def responses
    # @poll = Poll.find_by_share_key(params[:share_key])
    answers = params[:poll][:questions]
    answers.each do |question_id,response|
      @answer = Response.new(:response => response[:response], :question_id => question_id)
      @answer.save
    end
    redirect_to root_path
  end


end
