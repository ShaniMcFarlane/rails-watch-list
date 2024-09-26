class Movie < ApplicationRecord
  belongs_to :lists, through: :bookmarks
  has_many :bookmarks
  validates :title, presence: true, uniqueness: true
  validates :overview, presence: true
end
# A movie must have a unique title and an overview.
