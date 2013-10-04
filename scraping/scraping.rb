require 'nokogiri'
require 'open-uri'
require 'pry'

class Student

  ALL_STUDENTS = []

  attr_accessor :link, :image_link, :tagline, :profile_image, :name, :twitter, :linkedin,
                :github, :quote, :bio, :education, :work, :treehouse,
                :codeschool, :coderwall, :blogs, :personal_projects, :fav_cities,
                :fav_website, :fav_comic, :fav_radio, :flatiron_projects

  @@index_link = "http://students.flatironschool.com/"

  def initialize(link, image_link, tagline)
    @link = link
    @tagline = tagline
    @index_image = image_link
    ALL_STUDENTS << self
    self.scrape
  end

  def scrape
    full_link = @@index_link + self.link
    begin
      student_page = Nokogiri::HTML(open(full_link))
      # scrape individual elements

      # if student_page.css('h4.ib_main_header').text != ''
      #   self.name = student_page.css('h4.ib_main_header').text
      # else
      #   self.name = "No Name"
      # end
      # puts self.name

      # self.profile_image = student_page.css('img.student_pic').attr('src').text
      # puts self.profile_image

      # self.twitter = student_page.css('.page-title .icon-twitter').first.parent.attr('href')
      # puts self.twitter

      # self.linkedin = student_page.css('.page-title .icon-linkedin-sign').first.parent.attr('href')
      # puts self.linkedin

      # self.github = student_page.css('.page-title .icon-github').first.parent.attr('href')
      # puts self.github

      # self.quote = student_page.css('.textwidget h3').text
      # puts self.quote

      # self.bio = student_page.css('#scroll-about #ok-text-column-2 p').first.text
      # puts self.bio

      # self.education = student_page.css('#ok-text-column-3 ul').children.text.split("\n").collect do |ed_item|
      #   ed_item.strip
      # end
      # self.education.delete_if { |item| item.empty? }
      # if self.education.size > 0
      #   self.education = self.education.join('; ')
      # else
      #   self.education = "No data."
      # end
      # puts self.education.inspect

      # student_page.css('h3').each do |h3|
      #   if h3.text.strip.downcase == "work"
      #     self.work = h3.parent.parent.css('p').text.strip
      #   end
      # end
      # puts self.work

      # student_page.css('img').each do |icon|
      #   if icon.attr('alt') == "Treehouse"
      #     self.treehouse = icon.parent.attr('href')
      #   end
      # end
      # puts self.treehouse

      # student_page.css('img').each do |icon|
      #   if icon.attr('alt') == "Code School"
      #     self.codeschool = icon.parent.attr('href')
      #   end
      # end
      # puts self.codeschool

      # student_page.css('img').each do |icon|
      #   if icon.attr('alt') == "Coder Wall"
      #     self.coderwall = icon.parent.attr('href')
      #   end
      # end
      # puts self.coderwall

        self.blogs =
      # self.personal_projects =
      # self.fav_cities =
      # self.fav_website =
      # self.fav_comic =
      # self.fav_radio =
      # self.flatiron_projects =

    rescue
      # if student_page isn't a valid link
      false
    end
  end
end

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