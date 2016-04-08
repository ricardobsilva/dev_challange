require 'rails_helper'


RSpec.describe StudentsController, type: :controller do
  describe "GET #index" do
    let(:student1) { create(:student) }
    let(:student2) { create(:student) }
    
    before(:each) do
      get :index
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "renders the index template" do
      expect(response).to render_template(:index)
    end

    it "assigns all students as @students" do
      expect(assigns(:students)).to eq([student1, student2])
    end
  end

  describe "POST #create" do

    before(:each) do
      post :create, student: student_attributes
    end

    describe 'with valid parameters' do
      let(:student_attributes) { attributes_for(:student) }
      it "redirects to student listing" do
        expect(response).to redirect_to(students_path)
      end
    end
  end

  describe "GET #update" do
    let(:student) { create(:student) }

    before(:each) do
      delete :destroy, id: student.id
    end
    it "redirects to student listing" do
      expect(response).to redirect_to(students_path)
    end
  end

  describe "DELETE #destroy" do
    let(:student) { create(:student) }

    before(:each) do
      delete :destroy, id: student.id
    end

    it "destroys the requested student" do
      expect(Student.exists?(student.id)).to be(false)
    end

    it "redirects to the students list" do
      expect(response).to redirect_to(students_path)
    end
  end

end
