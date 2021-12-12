# frozen_string_literal: true

class Tag
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  has_many :quotes

  validates :name, presence: true
end
