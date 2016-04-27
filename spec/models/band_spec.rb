require 'rails_helper'

RSpec.describe Band, type: :model do

  # this is the test of validations with shoulda matchers
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:musical_genre) }
  it { is_expected.to validate_presence_of(:site) }

  # have many association with shoulda matchers
  it { is_expected.to have_many(:musics) }


  it 'has invalid site url' do
    band = build(:band, site: "google")
    band.valid?

    expect(band.errors[:site]).to include("must be a valid URL")
  end

  context '.in_genre scope' do
    it 'must select all songs by a single genre' do
      misfits   = create(:band, musical_genre: "rock", name: "misfits")
      megadeth  = create(:band, musical_genre: "rock", name: "megadeth")
      beyonce   = create(:band, musical_genre: "pop",  name: "beyonce")


      rock_bands = Band.in_genre("rock")

      expect(rock_bands).not_to include(beyonce)
      expect(rock_bands).to include(misfits, megadeth)
    end
  end
end
