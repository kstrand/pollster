class Poll < ActiveRecord::Base
  attr_accessible :name, :share_key, :edit_key
  before_create :key_gen


  private

  def key_gen
    self.edit_key = (0...4).map{65.+(rand(26)).chr}.join
    self.share_key = (0...4).map{65.+(rand(26)).chr}.join
  end


  # create a random key for editing and taking the poll
  # add two columns to the poll table to store it
  # run a before statement to get them generated
end
