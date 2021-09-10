class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: %w[Fiction Non-Fiction]
  validate :clickbait

  def clickbait
    bait = ["Won't Believe", "Secret", "Top", "Guess"]
    errors.add(:title, "Invalid title name!") if title && bait.none? { |word| title.include?(word) }
  end
end
