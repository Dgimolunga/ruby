class Post < ApplicationRecord

  validates :title, presence: true

  before_create :fill_published_at

  private

  def fill_published_at
    self.published_at ||= Time.current
  end
end
