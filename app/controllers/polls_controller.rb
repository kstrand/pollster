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
    #find the poll as it comes in through the custom routes
    #find the poll via the edit key in the params
    #make sure to account for any exceptions
  end

  def update
    @poll = Poll.find(params[:id])
    @poll.inspect
    @poll.update_attributes(params[:poll])
    redirect_to poll_edit_path(@poll.edit_key)
  end

  def destroy
  end

  def show
    @poll = Poll.find_by_share_key(params[:share_key])
  end
end
