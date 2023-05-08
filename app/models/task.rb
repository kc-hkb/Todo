class Task < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  validates :date, presence: true

  belongs_to :user
  belongs_to :board

  def author_name
    user.display_name
  end

end
