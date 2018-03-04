class Lecture < ApplicationRecord
  belongs_to :admin, class_name: 'User'

  has_many :notebooks, dependent: :destroy
  has_many :users, through: :notebooks

   def initialize(attributes = {})
     super
     User.find(self.admin_id).lectures << self
   end

end
