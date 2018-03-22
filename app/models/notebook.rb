class Notebook < ApplicationRecord
  belongs_to :user
  belongs_to :lecture

  serialize :content, JSON
end
