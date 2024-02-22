class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list

  validates :movie, presence: true
  validates :list, presence: true
  validates :movie, uniqueness: { scope: :list }
  validates :comment, length: { minimum: 6 }

end

# Validation reqs
# 1. has a comment
# 2. comment cannot be shorter than 6 characters
# 3. belongs to a movie
# 4. belongs to an list
# 5. movie cannot be blank
# 6. list cannot be blank
# 7. is unique for a given movie/list couple
