require_relative 'finder'
require_relative 'extractor'

class Manager

  class << self
    attr_accessor :zipcode, :date
  end

  def initialize(zipcode, date)
    @zipcode = zipcode
    @date = date
    @pages ||= find_pages
    @all_theaters = []
    Manager.zipcode = zipcode
    Manager.date = date
  end

  def find_pages
    Manager.zipcode = @zipcode
    Manager.date = @date
    Finder.new(@zipcode).hrefs
  end

  def extract_theaters
    if @pages
      @pages.each do |page|
        @all_theaters << Extractor.new(page, @zipcode).page_theaters
      end
      return @all_theaters.flatten
    else
      return nil
    end
  end
end
