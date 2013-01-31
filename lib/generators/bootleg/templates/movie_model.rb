class BootlegMovie < ActiveRecord::Base
  attr_accessible :name, :href, :showtimes, :cover_url

  has_many :bootleg_showtimes
  has_many :theaters, through: :bootleg_showtimes, source: :bootleg_theater

  def showtimes
    bootleg_showtimes
  end
end
