class Task < ApplicationRecord
  has_one_attached :eyecatch
  validates :title, presence: true
  validates :content, presence: true
  validates :date, presence: true

  has_many :comments
  belongs_to :user
  belongs_to :board

  def author_name
    user.display_name
  end

end
