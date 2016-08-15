require 'pry'
require 'colorize'
require 'artii'

class Seeker::CLI

	def call
		system "clear"
		string = Artii::Base.new :font => 'roman'
		puts string.asciify("          MovieSeeker")::red
		greeting
		exit
	end

	def greeting
		puts "----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"
		puts "[][][][][][][][][][][][][][][][][][][][]][][][][][][][][]][][][][][][][][]][][][][][][][][]][][][][][][][][]][][][][][][][][][][][][][]][][][][][][][][]][][][][][][][][]][][][][]"
		puts "----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"
		puts "               |                                      |                                     |                                     |                                               "
		puts "                   \t\t\t\tPlease type 'now' to view 'NOW PLAYING MOVIES', 'soon' FOR 'UPCOMING MOVIES' or 'exit' to 'EXIT'                                                       "
		puts "               |                                      |                                     |                                     |                                               "
		puts "----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"
		puts "[][][][][][][][][][][][][][][][][][][][]][][][][][][][][]][][][][][][][][]][][][][][][][][]][][][][][][][][]][][][][][][][][][][][][][]][][][][][][][][]][][][][][][][][]][][][][]"
		puts "----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"
		user_input = gets.strip.downcase
		if user_input == "now" || user_input == "soon"
			list(user_input)
		else exit
			return
		end
		
	end

	def stored_list_for_now
	   Seeker::In_theaters.create_in_theaters(Seeker::Scraper.scrape_in_theaters_page)
 	end

	def stored_coming_soon
		Seeker::Coming_soon.create_coming_soon(Seeker::Scraper.scrape_coming_soon_page)
	end


	def list(movie)
		system "clear"
		if movie == "now"
			puts "                   \t\t\t\t\t\t\t\tNOW PLAYING MOVIES"
			puts "----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"
			puts "[][][][][][][][][][][][][][][][][][][][]][][][][][][][][]][][][][][][][][]][][][][][][][][]][][][][][][][][]][][][][][][][][][][][][][]][][][][][][][][]][][][][][][][][]][][][][]"
			puts "----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"
			stored_list_for_now.each.with_index(1) do |hash, i|
				puts "#{i}. #{hash[:name]}"
			end
			menu(movie)
		else movie == "soon"
			puts "                   \t\t\t\t\t\t\t\tUPCOMING MOVIES"
			puts "----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"
			puts "[][][][][][][][][][][][][][][][][][][][]][][][][][][][][]][][][][][][][][]][][][][][][][][]][][][][][][][][]][][][][][][][][][][][][][]][][][][][][][][]][][][][][][][][]][][][][]"
			puts "----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"
			stored_coming_soon.each.with_index(1) do |hash, i|
				puts "#{i}. #{hash[:name]}"
			end
			menu(movie)
		end 
	end


	def list_description(movie, num)
		if movie == "now"
			puts "\nDescription:"
			stored_list_for_now.each.with_index(1) do |hash, i|
				if num == (i).to_s
					puts "#{hash[:description]}"
				end
			end
			menu(movie)
		elsif movie == "soon"
			puts "\nDescription:"
			stored_coming_soon.each.with_index(1) do |hash, i|
				if num == (i).to_s
					puts "#{hash[:description]}"
				end
			end
			menu(movie)
		end
	end

	def menu(movie)
		puts "\nEnter the number of the movie to see a description OR type 'greeting' for main menu"
		input = gets.strip
		if input == "greeting"
			puts "\n"
			greeting
			if movie == "now"
				list(movie)
			elsif movie == "soon"
				list(movie)
			end
		else
			description_action(movie, input)
		end
	end

	def description_action(movie, num)
		if(num.to_i.between?(1,9) == true)
			list_description(movie, num)
		end
	end


end