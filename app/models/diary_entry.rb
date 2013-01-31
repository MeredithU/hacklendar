class DiaryEntry < ActiveRecord::Base
	attr_accessible :title, :description, :mood


	 def self.positive
  		where(mood: ['happy', 'excited']).limit(5)
  	end
end