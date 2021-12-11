# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Quote, type: :model do
  context 'validates' do
    it { is_expected.to be_mongoid_document }
    it { is_expected.to have_timestamps }
    it { is_expected.to have_field(:quote).of_type(String) }
    it { is_expected.to validate_presence_of(:quote) }
  end

  context 'associations' do
    it { is_expected.to belong_to(:author) }
    it { is_expected.to have_many(:tags) }
  end
end
