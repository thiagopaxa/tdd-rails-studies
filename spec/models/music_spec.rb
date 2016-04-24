require 'rails_helper'

RSpec.describe Music, type: :model do
  it { is_expected.to validate_presence_of :title }
  it { is_expected.to validate_presence_of :name_author }

  it { is_expected.to belong_to :band }

  # this is the test of validations without shoulda matchers
  context "is valid when" do
    it 'has a valid factory' do
      expect(build(:music)).to be_valid
    end
  end

  context "is invalid when" do
    it 'has no title' do
      music = build(:music, title: nil)
      music.valid?

      expect(music.errors[:title]).to include("can't be blank")
    end

    it 'has no name_author' do
      music = build(:music, name_author: nil)
      music.valid?

      expect(music.errors[:name_author]).to include("can't be blank")
    end
  end

end
