module Href
  def all
    pages = []
    if count
      count.times { |nr| pages << url + (nr + 1).to_s }
    end
    pages
  end

  private

  def count
    # links = self.links.flatten.compact.select { |link| link.text.size < 3 and link.text =~ /\d/  }
    self.search("span").css(".page-status").first.text.last.to_i rescue nil
  end

  def url
    self.uri.to_s + '?page='
  end
end

