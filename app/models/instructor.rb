class Instructor < ApplicationRecord
  validates_presence_of :name
  has_many :instructor_students
  has_many :students, through: :instructor_students

  def average_student_age
    students.average(:age).to_f.round(2)
  end
end
