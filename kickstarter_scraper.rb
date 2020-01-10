# require libraries/modules here
require "nokogiri"
require "pry"
def create_project_hash
  # write your code here
  html = File.read('fixtures/kickstarter.html')

  kickstarter = Nokogiri::HTML(html)
  kickstarter.css(".clearfix list-simple, li").each { |e|  puts e.css("h2").text}
  # binding.pry
end
