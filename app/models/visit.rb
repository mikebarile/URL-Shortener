class Visit < ActiveRecord::Base
  validates :visitor_id, :page_id, presence: true

  belongs_to(:visitor,
    primary_key: :id,
    foreign_key: :visitor_id,
    class_name: :User
  )

  belongs_to(:shortened_url,
    primary_key: :id,
    foreign_key: :page_id,
    class_name: :ShortenedUrl
  )

  def self.record_visit(user, shortened_url)
    self.create(visitor_id: user.id, page_id: shortened_url.id)
  end
end
