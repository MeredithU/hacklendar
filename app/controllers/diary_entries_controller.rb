class DiaryEntriesController < ApplicationController

	def index
		@diary_entries = DiaryEntry.all

		@diary_entries_positive = DiaryEntry.positive("Happy")
	end

	def new
		@diary_entry = DiaryEntry.new
	end


	def create
		@diary_entry = DiaryEntry.new params[:diary_entry]

		# the if statement validates whether it saved or not
		if @diary_entry.save
			redirect_to diary_entries_path
		else
			render :new
		end
	end


	def edit
		@diary_entry = DiaryEntry.find(params[:id])
	end


	def update
		@diary_entry = DiaryEntry.find(params[:id])

		if @diary_entry.update_attributes params[:diary_entry]
			redirect_to diary_entries_path
		else
			render :edit
		end
	end


	def destroy
		@diary_entry = DiaryEntry.find(params[:id])

		@diary.destroy

		redirect_to diary_entries_path
	end

end
