class Comment < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'author_id', inverse_of: :comments
  belongs_to :post, class_name: 'Post', foreign_key: 'post_id', inverse_of: :comments

  after_create :increment_comments_counter
  after_destroy :decrement_comments_counter

  validates :user, presence: true
  validates :post, presence: true
  validates :text, presence: true

  private

  def increment_comments_counter
    post.increment!(:commentsCounter)
  end

  def decrement_comments_counter
    post.decrement!(:commentsCounter)
  end
end
