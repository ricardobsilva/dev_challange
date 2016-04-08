require 'rails_helper'

RSpec.describe Course, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_presence_of(:status) }
  it { is_expected.to have_many(:classrooms)}

  context 'is invalid' do
    it 'has a valid factory' do
      expect(build(:course)).to be_valid
    end
  end  

  context 'is invalid' do
    it 'without a first_name' do
      course = build(:course, name: nil)
      course.valid?
      expect(course.errors[:name]).to include("can't be blank")
    end
    it 'without a description' do
      course = build(:course, description: nil)
      course.valid?
      expect(course.errors[:description]).to include("can't be blank")
    end
    it 'without a status' do
      course = build(:course, status: nil)
      course.valid?
      expect(course.errors[:status]).to include("can't be blank")
    end
  end
end
