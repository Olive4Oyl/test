require 'pry'

class Seeker::Coming_soon

	 attr_accessor :name, :description

	 @@all = []

	 def initialize(coming_soon)
	 	coming_soon.each do |key, value|
			self.send("#{key}=", value) 
		end
		@@all << self
	end

	def self.all
		@@all
	end

	def self.create_coming_soon(coming_soon)
		coming_soon.each do |hash|
		Seeker::Coming_soon.new(hash)
		end
  	end



end