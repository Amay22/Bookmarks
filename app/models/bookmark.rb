# Bookmark Model to handle the database for Bookmarks
class Bookmark < ActiveRecord::Base
  belongs_to :user

  # Ensure that a user_id is present
  validates :user_id, presence: true

  # Ensure a title has at least 1 characters
  validates :title, presence: true, length: { minimum: 1 }

  # Ensure the url is present and has URL format
  validates :url, format: { with: Regexp.new(URI::regexp(%w(http https))),
                            message: 'should start with HTTP:// or HTTPS://' },
                  presence: true
end
