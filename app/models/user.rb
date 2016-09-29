class User < ActiveRecord::Base
  validates :email, uniqueness: true, presence: true

  has_many(:submitted_urls,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :ShortenedUrl
  )

  has_many(:visits,
    primary_key: :id,
    foreign_key: :visitor_id,
    class_name: :Visit
  )

  has_many(:visited_urls,
    Proc.new { distinct },
    through: :visits,
    source: :shortened_url
  )

  after_initialize :set_default_values

  def set_default_values
    # Only set if time_zone IS NOT set
    self.premium ||= false
  end

end
