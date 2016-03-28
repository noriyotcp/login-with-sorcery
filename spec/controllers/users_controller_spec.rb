RSpec.describe UsersController, type: :controller do

  describe "GET#show" do
    let(:user) { create(:user) }

    before {
      login_user user
      get :show, { id: user }
    }

    it { expect(response).to be_success }

    it "should assigns @user" do
      expect(assigns(:user)).to eq user
    end

    it { is_expected.to render_template "show" }

  end
end
