require 'rails_helper'

describe Instructor, type: :model do
  describe "validations" do
    it { should validate_presence_of :name}
  end
end
