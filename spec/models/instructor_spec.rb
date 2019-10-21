require 'rails_helper'

describe Instructor, type: :model do
  describe "validations" do
    it { should validate_presence_of :name}
  end

  describe "relationships" do
    it { should have_many :instructor_students}
    it { should have_many(:students).through(:instructor_students)}
  end

  describe "instance method" do
    it ".average_student_age" do
      instructor_1 = Instructor.create(name: "Mike Dao")
      student_1 = instructor_1.students.create(name: "Bob G", cohort_number: 1906, age: 43)
      student_2 = instructor_1.students.create(name: "Justin Bieber", cohort_number: 1908, age: 25)

      expect(instructor_1.average_student_age).to eq(34.0)
    end
  end
end
