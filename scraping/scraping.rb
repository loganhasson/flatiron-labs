require 'nokogiri'
require 'open-uri'
require 'pry'
require 'sqlite3'
require_relative './students.rb'

# create database
begin
  flatiron_students = SQLite3::Database.new( "flatiron_students.db" )
  flatiron_students.execute "CREATE TABLE IF NOT EXISTS students(id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT, profile_image TEXT, twitter TEXT, linkedin TEXT, github TEXT, quote TEXT, bio TEXT, education TEXT,
    work TEXT, treehouse TEXT, codeschool TEXT, coderwall TEXT, blogs TEXT, favorite_cities TEXT,
    favorites TEXT, tagline TEXT, image_link TEXT, page_link TEXT)"

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
    student = Student.new(s_link, student_images[i], student_taglines[i])
    student.save
  end

ensure
  flatiron_students.close if flatiron_students

end