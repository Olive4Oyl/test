require 'open-uri'
require 'nokogiri'
require 'pry'

class Seeker::Scraper

	def self.scrape_imdb_page
		link = "http://www.imdb.com/movies-in-theaters/?pf_rd_m=A2FGELUUNOQJNL&pf_rd_p=2495768482&pf_rd_r=0CJX4VFDVN5Y3KGM64HH&pf_rd_s=right-4&pf_rd_t=15061&pf_rd_i=homepage&ref_=hm_otw_hd"
		doc = Nokogiri::HTML(open(link))
		in_theaters_collection = doc.css(".list.detail.sub-list")

		in_theaters_collection.collect.with_index do |movie, i|
		in_theaters = {}
		in_theaters[:name] = in_theaters_collection.css(".overview-top h4")[i].text.strip
		in_theaters[:ratings] = in_theaters_collection.css(".metascore.no_ratings")[i].text.strip.tr("\n"," ")
		in_theaters[:descripton] = in_theaters_collection.css(".thebuzz")[i].text.strip.tr("\n", "")
		# in_theaters[:trailer] = in_theaters_collection.css(".overview-bottom a")[i].attribute("href").value
		# in_theaters[:ticket] = 
		in_theaters

		binding.pry
		end
	end



end