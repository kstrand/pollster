class Response < ActiveRecord::Base
  belongs_to :question
  attr_accessible :response, :question_id

end
