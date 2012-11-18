class Choice < ActiveRecord::Base
  belongs_to :question
  attr_accessible :option, :question_id
end
