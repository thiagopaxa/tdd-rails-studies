class Band < ActiveRecord::Base
  validates :name, :musical_genre, :site, presence: true
  validates :site, url: true

  has_many :musics
end
