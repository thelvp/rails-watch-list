class List < ApplicationRecord
  has_many :bookmarks, dependent: :destroy # So bookmarked movies are destroyed when destroying list
  has_many :movies, through: :bookmarks # Since not directly connected - via bookmarks in schema (join table!)
  validates :name, presence: true
  validates :name, uniqueness: true
end

# Validation reqs:
# 1. has a name
# 2. name cannot be blank
# 3. name is unique
# 4. has many bookmarks
# 5. has many movies (via bookmarks)
# 6. should destroy child saved movies when destroying self (so bookmarks)
