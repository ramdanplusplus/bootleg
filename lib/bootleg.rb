require "bootleg/version"
require "presenter"

module Bootleg
  def self.load(zipcode, date)
    Presenter.new(zipcode, date)
  end
end
