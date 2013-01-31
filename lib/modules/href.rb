module Href
  def all
    pages = []
    if count
      count.times { |nr| pages << url + nr.to_s }
    end
    pages
  end

  private

  def count
    # links = self.links.flatten.compact.select { |link| link.text.size < 3 and link.text =~ /\d/  }
    links = self.links.flatten.compact.select { |link| link.text.size < 3}
    #links = self.links.flatten.compact.select { |link| link.text.include?("http://www.moviefone.com/theater/")  }
    links.map{|a| puts "#{a.text} ====== #{a.uri.to_s}" }
    links.empty? ? nil : links.last.text.to_i
  end

  def url
    self.uri.to_s + '?page='
  end
end

