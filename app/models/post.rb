class Post < ApplicationRecord
  validates :content, presence: { message: '내용을 입력해' }, length: { maximum: 200 }
  validates :user_id, presence: true

  belongs_to :user
  belongs_to :postable, polymorphic: true
end
