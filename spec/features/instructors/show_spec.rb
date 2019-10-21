require 'rails_helper'

RSpec.describe "instructor show page" do
  describe "I can click a link on the Students Index page"
  it "takes me to Instructor Show page where I can see the instructor's
    - name
    - list of all their students names
    - average age of all their students" do

    instructor_1 = Instructor.create(name: "Mike Dao")
    instructor_2 = Instructor.create(name: "Meg Stang")

    student_1 = instructor_1.students.create(name: "Bob G", cohort_number: 1906, age: 43)
    student_2 = instructor_1.students.create(name: "Justin Bieber", cohort_number: 1908, age: 25)
    student_3 = instructor_2.students.create(name: "Taylor Swift", cohort_number: 1908, age: 30)
    student_4 = instructor_2.students.create(name: "Mike Wazowski", cohort_number: 1909, age: 40)

    visit '/students'

    click_link "Mike Dao"

    expect(current_path).to eq("/instructors/#{instructor_1.id}")
    expect(page).to have_content(instructor_1.name)
    expect(page).to have_content("Students:")

    within ".students" do
      instructor_1.students.each do |student|
        expect(page).to have_content(student.name)
      end
    end
    expect(page).to have_content("Average Age: 34.0")
  end
end

# As a user,
# When I visit the Students Index Page,
#   Then I see each instructor's name is a link
# When I click the link
#   Then I am taken to an Instructor Show Page where I see the instructor with that id including the instructor's:
#   - name
#   - a list of all their students names
#   - the average age of all their students
