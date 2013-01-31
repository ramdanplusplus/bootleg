require_relative 'modules/zipcode'
require_relative 'modules/href'

class Finder
  def initialize(zipcode)
  	@zipcode = zipcode
    zipcode.extend Zipcode
    @href = zipcode.search
  end

  def hrefs
    @href.extend Href
    @href.all("12201")
  end
end
