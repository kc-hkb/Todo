class Board < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true

  belongs_to :user
  has_many :tasks, dependent: :destroy
  has_many :comments, dependent: :destroy

  def author_name
    user.display_name
  end

end
