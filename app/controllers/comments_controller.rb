class CommentsController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]
  before_filter :correct_user, only: :destroy
  def index

  end

  def create
    @entry = current_user.entries.build(params[:entry])
    if @entry.save
      flash[:success] = "Entry posted!"
      redirect_to root_path
    else
      @feed_items = []
      render root_path
    end 
  end

  def destroy

  end

  def show

  end

  def new

  end

  private
  def correct_user
    @comment = current_user.comment.find_by_id(params[:id])
    redirect_to root_path if @comment.nil?
  end
end
