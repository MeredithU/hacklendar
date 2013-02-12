class DiaryEntry < ActiveRecord::Base
	attr_accessible :title, :description, :mood

	validates :title, :presence => true, :uniqueness => true
  validates :description, :presence => true
  validates :mood, :inclusion => { :in => %w(happy excited) }

  validate :mondaythursday

  #customized validation method
  def mondaythursday
    if Time.now.monday? || Time.now.thursday?
      if !happy?
        errors[:mood] << "must be happy."
      end
    end
  end


	def self.positive(title)
  		where(mood: title).limit(5)
  end

  # this is an instance method, in order to check against all of the diary entries,
  # pull out the specific id then check.
  def happy?
  	mood == "happy"
  end

end