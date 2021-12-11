# frozen_string_literal: true

class Quote
  include Mongoid::Document
  include Mongoid::Timestamps

  field :quote, type: String

  belongs_to :author
  has_many :tags

  validates :quote, presence: true
end
