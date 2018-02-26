class Lecture < ApplicationRecord
  belongs_to :admin, class_name: 'User'

  has_many :notebooks
  has_many :users, through: :notebooks
  
end
