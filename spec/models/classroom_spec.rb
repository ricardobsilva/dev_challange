require 'rails_helper'

RSpec.describe Classroom, type: :model do
  it { is_expected.to validate_presence_of(:student_id) }
  it { is_expected.to validate_presence_of(:course_id) }
  it { is_expected.to belong_to(:student)}
  it { is_expected.to belong_to(:course)}

  context 'is invalid' do
    it 'has a valid factory' do
      expect(build(:classroom)).to be_valid
    end
  end  

  context 'is invalid' do
    it 'without a student' do
      classroom = build(:classroom, student_id: nil)
      classroom.valid?
      expect(classroom.errors[:student_id]).to include("can't be blank")
    end
    it 'without a course' do
      classroom = build(:classroom, course_id: nil)
      classroom.valid?
      expect(classroom.errors[:course_id]).to include("can't be blank")
    end
  end
end
