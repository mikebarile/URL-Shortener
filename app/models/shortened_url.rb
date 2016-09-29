class ShortenedUrl < ActiveRecord::Base
  validates :short_url, uniqueness: true, presence: true
  validates :long_url, :user_id, presence: true
  validates :long_url, length: { maximum: 1023 }
  validate :max_five_submits

  def max_five_submits
    p urls = User.find_by(id: user_id).submitted_urls.where("created_at >
        '#{1.minute.ago}'::TIMESTAMP").length

    errors[:submit_error] << "Too many submits within a minute" if urls > 5
  end

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

  has_many(:visits,
    primary_key: :id,
    foreign_key: :page_id,
    class_name: :Visit
  )

  has_many(:visitors,
    Proc.new { distinct },
    through: :visits,
    source: :visitor
  )

  #has_many :visitors, Proc.new { distinct }, through: :visits, source: :visitor

  def num_clicks
    clicks = ActiveRecord::Base.connection.execute("
      SELECT *
      FROM visits
      ").map{|l| l}.length
  end

  def num_uniques
    clicks = visitors.length
  end

  def num_recent_uniques
    clicks = ActiveRecord::Base.connection.execute("
      SELECT DISTINCT visitor_id
      FROM visits
      WHERE updated_at > '#{10.minutes.ago}'::TIMESTAMP
      ").map{|l| l}.length
  end
end
