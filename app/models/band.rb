class Band < ActiveRecord::Base
  validates :name, :musical_genre, :site, presence: true
end
