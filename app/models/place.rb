class Place < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]

  def should_generate_new_friendly_id?
    new_record? || slug.nil? || slug.blank? # you can add more condition here
  end

  belongs_to :user
  has_many :comments
  has_many :photos

  geocoded_by :address
  after_validation :geocode

  validates :name, :presence => true
  validates :description, :presence => true
  validates :address, :presence => true
end
