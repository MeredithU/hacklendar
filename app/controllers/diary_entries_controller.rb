class DiaryEntriesController < ApplicationController

	def index
		@diary_entries = DiaryEntry.all

		@diary_entries_positive = DiaryEntry.positive("Happy")
	end

	def new
		@diary_entries = DiaryEntry.new
	end

	def create
		@diary_entry = DiaryEntry.create params["diary_entry"]

		if (DiaryEntry.title == "")
			render new_diary_entry_path
		else
			redirect_to diary_entries_path
		end
	end

end
