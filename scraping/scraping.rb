require 'nokogiri'
require 'open-uri'
require 'pry'
require_relative './students.rb'

# scrape students index page
students_index = Nokogiri::HTML(open("http://students.flatironschool.com"))

# create array of student links
student_links = students_index.css('.home-blog-post').collect do |student|
  student.css('a').attr('href').to_s
end

# create array of student taglines
student_taglines = students_index.css('.home-blog-post-meta').collect do |student|
  student.text
end

# create array of student image links, assigning '#' if one doesn't exist
student_images = students_index.css('.home-blog-post a').collect do |student|
  begin
    student.css('img').attr('src').text
  rescue
    '#'
  end
end

# create student instances
student_links.each_with_index do |s_link, i|
  Student.new(s_link, student_images[i], student_taglines[i])
end