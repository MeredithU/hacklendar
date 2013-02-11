class DiaryEntry < ActiveRecord::Base
	attr_accessible :title, :description, :mood


	def self.positive(title)
  		where(mood: title).limit(5)
  	end

  	# this is an instance method, in order to check against all of the diary entries,
  	# pull out the specific id then check.
  	def happy?
  		mood == "Happy"
  	end

end