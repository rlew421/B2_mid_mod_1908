require 'rails_helper'

RSpec.describe "students index page", type: :feature do
  it "I can see each student in the system along with their
    - name
    - cohort name
    - name of each instructor that they have" do

    student_1 = Student.create(name: "Bob G", cohort_number: 1906, age: 43)
    student_2 = Student.create(name: "Justin Bieber", cohort_number: 1908, age: 25)
    student_3 = Student.create(name: "Taylor Swift", cohort_number: 1908, age: 30)

    visit '/students'

    expect(page).to have_content("Name: #{student_1.name}")
    expect(page).to have_content("Cohort: #{student_2.cohort_number}")
    expect(page).to have_content("Age: #{student_3.age}")
  end
end
