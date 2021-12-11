# frozen_string_literal: true

class Author
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :author_url, type: String

  has_many :quotes

  validates :name, :author_url, presence: true
end
