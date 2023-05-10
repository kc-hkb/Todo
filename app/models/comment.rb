class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :task

  def author_name
    user.display_name
  end

end
