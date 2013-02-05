require_relative 'manager'
class Presenter
  attr_reader :theaters

  def initialize(zipcode, date)
    @theaters ||= Manager.new(zipcode, date).extract_theaters
  end
end
