require 'uri'

class Url < ActiveRecord::Base 
  belongs_to :user

  validates :long_name, presence: true
  validates_format_of :long_name, :with => URI::regexp(%w(http https))
  
  before_create :generate_shortened_url

  
  def generate_shortened_url
    short = 5.times.map { (rand(0..25) + 97).chr }.join
    if Url.where(short_name: short).any?
      generate_shortened_url
    else
      self.short_name = short
    end
  end

  def self.new_url(params)
    Url.new(long_name: params[:user_input])
  end

  def self.find_url(short_url)
    self.find_by_short_name(short_url)
  end

end
