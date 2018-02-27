class LectureSerializer < ActiveModel::Serializer
  attributes :id, :title, :date_time

  has_one :admin
  has_many :users
  has_many :notebooks

end
