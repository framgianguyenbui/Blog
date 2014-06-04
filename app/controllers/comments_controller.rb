class CommentsController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]
  before_filter :correct_user, only: :destroy
  def index

  end

  def create
    @comment = current_user.comments.build(params[:comment])
    if @comment.save
      @comments = Comment
      flash[:success] = "Entry posted!"
      redirect_back_or root_path
    else
      @comments = []
      redirect_back_or root_path
    end 
  end

  def destroy
    @entry.destroy
  end

  private
  def correct_user
    @comment = current_user.comment.find_by_id(params[:id])
    redirect_to root_path if @comment.nil?
  end
end
