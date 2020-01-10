# require libraries/modules here
require "nokogiri"
require "pry"
def create_project_hash
  # write your code here
  html = File.read('fixtures/kickstarter.html')

  kickstarter = Nokogiri::HTML(html)
  result = {}
  kickstarter.css(".clearfix list-simple, .project grid_4, h2").each do |e|
    title = e.css("a").text
    result[title] = {
      :image_link => e.css("div.project-thumbnail a img").attribute
      :description => e.css("p.bbcard_blurb").text,
      :location => e.css("ul.project-meta span.location-name").text,
      :percent_funded => e.css("ul.project-stats li.first.funded strong").text.gsub("%","").to_i
    }
  end
  # binding.pry
end
