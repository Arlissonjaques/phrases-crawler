# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Author, type: :model do
  context 'validates' do
    it { is_expected.to be_mongoid_document }
    it { is_expected.to have_timestamps }
    it { is_expected.to have_fields(:name, :author_url).of_type(String) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:author_url) }
  end
end
