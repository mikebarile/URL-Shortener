class ShortenedUrl < ActiveRecord::Base
  validates :short_url, uniqueness: true, presence: true
  validates :long_url, :user_id, presence: true

  def self.random_code
    string = SecureRandom.urlsafe_base64(12)
    until !self.exists?(short_url: string)
      string = SecureRandom.urlsafe_base64(12)
    end
    string
  end

  def self.create_for_user_and_long_url!(user, long_url)
    self.create!(user_id: user.id, long_url: long_url, short_url: random_code)
  end

  belongs_to(:submitter,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User
  )
end
