require 'rails_helper'

RSpec.describe Music, type: :model do
  it { is_expected.to belong_to :band }
end
