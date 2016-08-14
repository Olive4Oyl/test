require 'open-uri'
require 'nokogiri'
require 'pry'

class Seeker::Scraper

	# def self.scrape_in_theaters_page
	# 	link = "http://www.imdb.com/movies-in-theaters/?pf_rd_m=A2FGELUUNOQJNL&pf_rd_p=2495768482&pf_rd_r=0CJX4VFDVN5Y3KGM64HH&pf_rd_s=right-4&pf_rd_t=15061&pf_rd_i=homepage&ref_=hm_otw_hd"
	# 	doc = Nokogiri::HTML(open(link))
	# 	in_theaters_collection = doc.css(".list_item.odd")

	# 	in_theaters_collection.collect.with_index do |movie, i|
	# 	in_theaters = {}
	# 	in_theaters[:name] = in_theaters_collection.css(".overview-top h4")[i].text.strip
	# 	in_theaters[:ratings] = in_theaters_collection.css(".metascore.no_ratings strong")[i].text
	# 	in_theaters[:description] = in_theaters_collection.css(".outline")[i].text.strip.tr("\n", "")
	# 	in_theaters
	# 	# binding.pry
	# 	end
	# end

	def self.scrape_coming_soon_page
		link = "http://www.imdb.com/movies-coming-soon/?ref_=inth_cs"
		doc = Nokogiri::HTML(open(link))
		coming_soon_collection = doc.css(".list_item.odd")

  		coming_soon_collection.collect.with_index do |movie, i|
		coming_soon = {}
		coming_soon[:name] = coming_soon_collection.css(".overview-top h4")[i].text.strip
		coming_soon[:ratings] = coming_soon_collection.css(".rating_txt")[i].text.strip.tr("\n", "")
		coming_soon[:description] = coming_soon_collection.css(".outline")[i].text.strip.tr("\n", "")
		coming_soon 
	    # binding.pry
	  end
	end




end