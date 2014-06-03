class EntriesController < ApplicationController

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
			@comment_items = []
			render root_path
		end	
	end

	def show
		@user = current_user
		@entry = current_user.entries.find_by_id(params[:id])
		@comments = @entry.comments.paginate(:page => params[:page], :per_page => 7)	
	end

	def destroy
		@entry.destroy
		redirect_back_or root_path
	end

	private
	def correct_user
		@entry = current_user.entries.find_by_id(params[:id])
		redirect_to root_path if @entry.nil?
	end
end
