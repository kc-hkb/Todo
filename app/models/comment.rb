class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :task
  belongs_to :board

  def author_name
    user.display_name
  end

  def avatar_image
    if profile&.avatar&.attached?
      profile.avatar
    else
      'default-avatar.svg'
    end
  end

end
