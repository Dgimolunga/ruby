class Post < ApplicationRecord
  has_many :comments, inverse_of: :post,  dependent: :destroy

  with_options presence: true do
    validates :title
    validates :content
  end

  before_create :add_cached_info

  private

  def add_cached_info
    add_text_length
    add_published_at
    add_the_year_of_publishing
  end

  def add_text_length
    self.text_length = self.content.to_s.length
  end

  def add_published_at
    self.published_at ||= Time.current
  end

  def add_the_year_of_publishing
    self.the_year_of_publishing ||= self.published_at&.year
  end
end
