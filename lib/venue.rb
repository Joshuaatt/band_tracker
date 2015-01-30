class Venue < ActiveRecord::Base
  has_and_belongs_to_many :bands
  validates(:venue_name, :presence => true)
  before_save(:capitalize_name)


private

  def capitalize_name
    self.venue_name = venue_name.capitalize
  end
end
