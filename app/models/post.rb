class Post < ApplicationRecord
  validates :title, presence: true, length: {
    in: 2..256, 
    too_long: "%{count} characters is the maxmimum",
    too_short: "%{count} characters is the minimum"
  }
  validates :body, presence: true, length: {minimum: 2}
end
