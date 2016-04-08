require 'rails_helper'

RSpec.describe CoursesController, type: :controller do
  describe "GET #index" do
    let(:course1) { create(:course) }
    let(:course2) { create(:course) }
    let(:course3) { create(:course) }
    let(:course4) { create(:course) }
    
    before(:each) do
      get :index
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "renders the index template" do
      expect(response).to render_template(:index)
    end

    it "assigns all courses as @courses" do
      expect(assigns(:courses)).to eq([course1, course2, course3, course4])
    end
  end

  describe "POST #create" do

    before(:each) do
      post :create, course: course_attributes
    end

    describe 'with valid parameters' do
      let(:course_attributes) { attributes_for(:course) }
      it "redirects to course listing" do
        expect(response).to redirect_to(courses_path)
      end
    end
  end

  describe "GET #update" do
    let(:course) { create(:course) }

    before(:each) do
      delete :destroy, id: course.id
    end
    it "redirects to course listing" do
      expect(response).to redirect_to(courses_path)
    end
  end

  describe "DELETE #destroy" do
    let(:course) { create(:course) }

    before(:each) do
      delete :destroy, id: course.id
    end

    it "destroys the requested crouse" do
      expect(Course.exists?(course.id)).to be(false)
    end

    it "redirects to the courses list" do
      expect(response).to redirect_to(courses_path)
    end
  end
end
