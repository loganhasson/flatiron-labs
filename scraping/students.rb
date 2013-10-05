require 'nokogiri'
require 'open-uri'
require 'pry'
require 'sqlite3'

class Student

  ALL_STUDENTS = []

  attr_accessor :link, :image_link, :tagline, :profile_image, :name, :twitter, :linkedin,
                :github, :quote, :bio, :education, :work, :treehouse,
                :codeschool, :coderwall, :blogs, :fav_cities,
                :favorites, :full_link, :student_page

  @@index_link = "http://students.flatironschool.com/"

  def initialize(link, image_link, tagline)
    @link = link
    @tagline = tagline
    @index_image = image_link
    @full_link = @@index_link + self.link
    ALL_STUDENTS << self
    self.scrape
  end

  def scrape_name
    if @student_page.css('h4.ib_main_header').text != ''
      self.name = @student_page.css('h4.ib_main_header').text
    else
      self.name = "No Name"
    end
    puts self.name
  end

  def scrape_profile_image
    self.profile_image = @student_page.css('img.student_pic').attr('src').text
    puts self.profile_image
  end

  def scrape_twitter
    self.twitter = @student_page.css('.page-title .icon-twitter').first.parent.attr('href')
    puts self.twitter
  end

  def scrape_linkedin
    self.linkedin = @student_page.css('.page-title .icon-linkedin-sign').first.parent.attr('href')
    puts self.linkedin
  end

  def scrape_github
    self.github = @student_page.css('.page-title .icon-github').first.parent.attr('href')
    puts self.github
  end

  def scrape_quote
    self.quote = @student_page.css('.textwidget h3').text
    puts self.quote
  end

  def scrape_bio
    self.bio = @student_page.css('#scroll-about #ok-text-column-2 p').first.text
    puts self.bio
  end

  def scrape_education
    self.education = @student_page.css('#ok-text-column-3 ul').children.text.split("\n").collect do |ed_item|
      ed_item.strip
    end

    self.education.delete_if { |item| item.empty? }
    if self.education.size > 0
      self.education = self.education.join('; ')
    else
      self.education = "No data."
    end

    puts self.education.inspect
  end

  def scrape_work
    @student_page.css('h3').each do |h3|
      if h3.text.strip.downcase == "work"
        self.work = h3.parent.parent.css('p').text.strip
      end
    end
    
    puts self.work
  end

  def scrape_treehouse
    @student_page.css('img').each do |icon|
      if icon.attr('alt') == "Treehouse"
        self.treehouse = icon.parent.attr('href')
      end
    end
    
    puts self.treehouse
  end

  def scrape_codeschool
    @student_page.css('img').each do |icon|
      if icon.attr('alt') == "Code School"
        self.codeschool = icon.parent.attr('href')
      end
    end
    
    puts self.codeschool
  end

  def scrape_coderwall
    @student_page.css('img').each do |icon|
      if icon.attr('alt') == "Coder Wall"
        self.coderwall = icon.parent.attr('href')
      end
    end
    
    puts self.coderwall
  end

  def scrape_blogs
    @student_page.css('h3').each do |h3|
      if h3.text.strip.downcase == "blogs"
        self.blogs = h3.parent.parent.css('a').map do |link|
          "#{link.text} - #{link.attr('href')}"
        end.join("\n")
      end
    end
    
    puts self.blogs
  end

  def scrape_cities
    @student_page.css('h3').each do |h3|
      if h3.text.strip.downcase == "favorite cities"
        self.fav_cities = h3.parent.parent.css('a').to_a.join('; ')
      end
    end
  
  puts self.fav_cities
  end

  def scrape_favories
    @student_page.css('h3').each do |h3|
      if h3.text.strip.downcase == "favorites"
        self.favorites = h3.parent.parent.css('p').map do |favorite|
          favorite.text.gsub(/^\s*- /, "")
        end
      end
    end
    
    puts self.favorites
  end

  def scrape

    begin

      @student_page = Nokogiri::HTML(open(@full_link))

      # scrape individual elements

      self.scrape_name
      self.scrape_profile_image
      self.scrape_twitter
      self.scrape_linkedin
      self.scrape_github
      self.scrape_quote
      self.scrape_bio
      self.scrape_education
      self.scrape_work
      self.scrape_treehouse
      self.scrape_codeschool
      self.scrape_coderwall
      self.scrape_blogs
      self.scrape_cities
      self.scrape_favorites

    rescue
      # if student_page isn't a valid link   
      false

    end
  end

  def save

  end

end