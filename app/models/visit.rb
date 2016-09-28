class Visit < ActiveRecord::Base
  validates :visitor_id, :page_id, presence: true

  def self.record_visit(user, shortened_url)
    self.create(visitor_id: user.id, page_id: shortened_url)
  end
end
