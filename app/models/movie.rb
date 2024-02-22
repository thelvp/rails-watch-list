class Movie < ApplicationRecord
  has_many :bookmarks
  validates :title, :overview, presence: true
end

# Validation reqs
# 1. has a title and an overview
# 2. title is unique
# 3. title cannot be blank
# 4. overview cannot be blank
# 5. has many bookmarks
# 6. should not be able to destroy self if has bookmarks children
