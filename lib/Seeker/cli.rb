require 'pry'

class Seeker::CLI

	def call
		puts Seeker::In_theaters.create_in_theaters(Seeker::Scraper.scrape_imdb_page)
	end

end