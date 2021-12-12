require 'rails_helper'

RSpec.describe Tag, type: :model do
  context 'validates' do
    it { is_expected.to be_mongoid_document }
    it { is_expected.to have_timestamps }
    it { is_expected.to have_field(:name).of_type(String) }
    it { is_expected.to validate_presence_of(:name) }
  end

  context 'associations' do
    it { have_many(:quotes) }
  end
end