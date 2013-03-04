class DiaryEntriesController < ApplicationController

	def index
		# @diary_entries = DiaryEntry.all

		# @day = '2013-02-01'.to_date

		if params[:day]
			@day = params[:day].to_date
		else
			@day = Date.today
		end

		@diary_entries = DiaryEntry.where(created_at: @day.beginning_of_day..@day.end_of_day)

		@diary_entries_month = DiaryEntry.where(created_at: @day.beginning_of_month..@day.end_of_month)

		@diary_entry_check = @diary_entries_month.map do |i|

			{
				date: i.created_at.to_date,
				mood: i.mood
			}

		end


		# @diary_entries_positive = DiaryEntry.positive('happy')
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
