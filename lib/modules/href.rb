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
    links = self.links.flatten.compact #.select { |link| link.text.size < 3 and link.text =~ /\d/  }
    links.empty? ? nil : links.last.text.to_i
    # self.links.each do |link|
    #   if link
    #     if link.text.size < 3 and link.text =~ /\d/
    #       link
    #     end
    #   end
    # end
  end

  def url
    self.uri.to_s + '?page='
  end
end

