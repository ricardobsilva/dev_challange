require 'rails_helper'


RSpec.describe ClassroomsController, type: :controller do
  
  describe "GET #index" do
    
    it { is_expected.to use_before_action(:students) }
    it { is_expected.to use_before_action(:courses) }
    
    let(:classroom1) { create(:classroom) }
    let(:classroom2) { create(:classroom) }
    let(:classroom3) { create(:classroom) }
    
    before(:each) do
      get :index
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "renders the index template" do
      expect(response).to render_template(:index)
    end

    it "assigns all classrooms as @classrooms" do
      expect(assigns(:classrooms)).to eq([classroom1, classroom2, classroom3])
    end
  end

  describe "POST #create" do

    before(:each) do
      post :create, classroom: classroom_attributes
    end

    describe 'with valid parameters' do
      let(:classroom_attributes) { attributes_for(:classroom) }
      it "redirects to classroom listing" do
        expect(response).to redirect_to(classrooms_path)
      end
    end
  end

  describe "GET #update" do
    let(:classroom) { create(:classroom) }

    before(:each) do
      delete :destroy, id: classroom.id
    end
    it "redirects to classroom listing" do
      expect(response).to redirect_to(classrooms_path)
    end
  end

  describe "DELETE #destroy" do
    let(:classroom) { create(:classroom) }

    before(:each) do
      delete :destroy, id: classroom.id
    end

    it "destroys the requested classroom" do
      expect(Classroom.exists?(classroom.id)).to be(false)
    end

    it "redirects to the classrooms list" do
      expect(response).to redirect_to(classrooms_path)
    end
  end
end
