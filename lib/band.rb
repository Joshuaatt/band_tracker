class Band < ActiveRecord::Base
  has_and_belongs_to_many :venues
  validates(:band_name, :presence => true)
  before_save(:capitalize_name)


private

  def capitalize_name
    self.band_name = band_name.capitalize
  end
end
