require 'pry'
require 'colorize'
require 'artii'

class Seeker::CLI

	def call
		system "clear"
		string = Artii::Base.new :font => 'roman'
		puts string.asciify("          MovieSeeker")::red
		greeting
	

		# Seeker::In_theaters.create_in_theaters(Seeker::Scraper.scrape_odd_page)
	end

	def greeting
		puts "----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"
		puts "[][][][][][][][][][][][][][][][][][][][]][][][][][][][][]][][][][][][][][]][][][][][][][][]][][][][][][][][]][][][][][][][][][][][][][]][][][][][][][][]][][][][][][][][]][][][][]"
		puts "----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"
		puts "               |                                      |                                     |                                     |                                               "
		puts "                    \t\t\t\tPlease type 'now' to view 'NOW PLAYING MOVIES' or 'soon' FOR 'UPCOMING MOVIES'                                                                        "
		puts "               |                                      |                                     |                                     |                                               "
		puts "----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"
		puts "[][][][][][][][][][][][][][][][][][][][]][][][][][][][][]][][][][][][][][]][][][][][][][][]][][][][][][][][]][][][][][][][][][][][][][]][][][][][][][][]][][][][][][][][]][][][][]"
		puts "----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"
		user_input = gets.strip.downcase
		if user_input == "soon"
			list(user_input)
		end
	end

	def stored_coming_soon
		Seeker::Coming_soon.create_coming_soon(Seeker::Scraper.scrape_coming_soon_page)
	end

	def list(user_input)
		system "clear"
		puts "                   \t\t\t\t\t\t\t\tUPCOMING MOVIES"
		puts "----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"
		puts "[][][][][][][][][][][][][][][][][][][][]][][][][][][][][]][][][][][][][][]][][][][][][][][]][][][][][][][][]][][][][][][][][][][][][][]][][][][][][][][]][][][][][][][][]][][][][]"
		puts "----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"
		if user_input == "soon"
			stored_coming_soon.each.with_index(1) do |hash, i|
				puts "#{i}. #{hash[:name]}"
			end
		end 
	end

	def ratings(user_input)
		puts "type 'ratings' to see "
		if user_input == "soon"
			stored_coming_soon.each.with_index(1) do |hash, i|
				puts "#{i}. #{hash[:ratings]}"
			end
		end
	end

	# def list_for_now
	#    Seeker::In_theaters.create_in_theaters(Seeker::Scraper.scrape_in_theaters_page)
	#    binding.pry
 # 	end
 

end