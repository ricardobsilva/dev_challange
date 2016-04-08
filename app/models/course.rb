class Course < ActiveRecord::Base
  validates :name, :description, :status, presence: :true
  has_many :classrooms
end
