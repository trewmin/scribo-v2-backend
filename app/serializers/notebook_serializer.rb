class NotebookSerializer < ActiveModel::Serializer
  attributes :id, :lecture_id, :user_id, :content, :updated_at, :video_id

  has_one :user
  has_one :lecture

end
