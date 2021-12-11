# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validates' do
    it { is_expected.to be_mongoid_document }
    it { is_expected.to have_timestamps }
    it { is_expected.to have_fields(:email, :password_digest).of_type(String) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_format_of(:email) }
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_length_of(:password) }
  end
end
