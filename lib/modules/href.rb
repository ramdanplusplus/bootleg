module Href
  def all(zipcode)
    pages = []
    if count
      count.times { |nr| pages << url(zipcode) + (nr + 1).to_s }
    end
    pages.map{|pa| puts pa}
    pages
  end

  private

  def count
    # # links = self.links.flatten.compact.select { |link| link.text.size < 3 and link.text =~ /\d/  }
    # links = self.links.flatten.compact.select { |link| link.text.size < 3}
    # #links = self.links.flatten.compact.select { |link| link.text.include?("http://www.moviefone.com/theater/")  }
    # links.map{|a| puts "#{a.text} ====== #{a.uri.to_s}" }
    # links.empty? ? nil : links.last.text.to_i
    self.search("span").css(".page-status").first.text.last.to_i

  end

  def url(zipcode)
    #self.uri.to_s + '?page='
    "http://www.moviefone.com/showtimes/albany-ny/#{zipcode}/theaters?page="
  end
end

