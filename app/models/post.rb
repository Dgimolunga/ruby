class Post < ApplicationRecord
  has_many :comments, dependent: :delete_all
  validates :title, :content, presence: true
  before_create :add_text_length, :add_published_at ,:add_the_year_of_publishing
  after_create :newc



  private
    def add_text_length
      self.text_length = self.content.length
    end
    def add_published_at
      self.published_at = DateTime.now
    end
    def add_the_year_of_publishing
      self.the_year_of_publishing = self.published_at.year
    end
    def newc
      #self.comments.create(text_commet: "1111111111111111111111111")
    end
end
