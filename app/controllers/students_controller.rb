class StudentsController < ApplicationController
  def index
    @students = Student.all
    @instructors = Instructor.all
  end
end
