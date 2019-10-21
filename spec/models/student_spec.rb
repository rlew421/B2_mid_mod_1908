require 'rails_helper'

Rspec.describe Student, type: :model do
  describe "validations" do
    it { should validate_presence_of :name}
    it { should validate_presence_of :cohort_number}
    it { should validate_presence_of :age}
  end
end
