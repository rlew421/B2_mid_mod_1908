class Student < ApplicationRecord
  validates_presence_of :name,
                        :cohort_number,
                        :age
end
