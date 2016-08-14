require 'pry'

class Seeker::In_theaters

	 attr_accessor :name, :ratings, :description

	 @@all = []

	 def initialize(in_theaters)
	 	in_theaters.each do |key, value|
			self.send("#{key}=", value) 
			# binding.pry
		end
		@@all << self
	end

	def self.all
		@@all
	end

	def self.create_in_theaters(in_theaters)
		in_theaters.each do |hash|
		Seeker::In_theaters.new(hash)
		# binding.pry
	end
  end



end