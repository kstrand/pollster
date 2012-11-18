class QuestionsController < ApplicationController

  def create
    @question = Question.new(params[:question])
    @question.save
    redirect_to poll_edit_path(@question.poll.edit_key)
  end

  def manage_choices
    @question = Question.find(params[:question_id])
    @choices = @question.choices
  end

  def update
    @questions = Question.find_by_question_id(params[:questions_id])

    @questions.update!
  end


end



# multiple choices belong to a question
#questions has many choices and choices has_a qur

# poll has many questions
# poll edit page ability to add options for each question
# add edit delete options and then on our pole responses page check if question has any optioins
#if it does make radio butttons so user can choosse the options if not regular text box.
#ability to add options to a questions add a view in the same page or link to another page.


#params that come throu



#{}"question"=>{"choices_attributes"=>{"0"=>{"option"=>"Barack Obama", "_destroy"=>"0", "id"=>"2"}, "1"=>{"option"=>"Mitt romney sadfsdaf", "_destroy"=>"0", "id"=>"3"}