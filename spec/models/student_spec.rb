require 'rails_helper'

RSpec.describe Student, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:register_number) }
  it { is_expected.to validate_presence_of(:status) }
  it { is_expected.to have_many(:classrooms)}

  context 'is invalid' do
    it 'has a valid factory' do
      expect(build(:student)).to be_valid
    end
  end  

  context 'is invalid' do
    it 'without a first_name' do
      student = build(:student, name: nil)
      student.valid?
      expect(student.errors[:name]).to include("can't be blank")
    end
    it 'without a register_number' do
      student = build(:student, register_number: nil)
      student.valid?
      expect(student.errors[:register_number]).to include("can't be blank")
    end
    it 'without a status' do
      student = build(:student, status: nil)
      student.valid?
      expect(student.errors[:status]).to include("can't be blank")
    end
  end

end
