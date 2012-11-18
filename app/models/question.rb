class Question < ActiveRecord::Base
  attr_accessible :body, :poll_id
  belongs_to :poll
  has_many :responses
  has_many :choices
  accepts_nested_attributes_for :choices
end
