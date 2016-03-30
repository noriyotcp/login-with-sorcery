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

  describe "POST create" do
    describe "with valid params" do
      it "creates a new user" do
        expect {
          post :create, user: attributes_for(:user)
        }.to change(User, :count).by(1)
      end

      it "assigns a newly created user as @user" do
        post :create, user: attributes_for(:user)
        expect(assigns(:user)).to be_a(User)
        expect(assigns(:user)).to be_persisted
      end

      it "redirects to the created user" do
        post :create, user: attributes_for(:user)
        expect(response).to redirect_to User.last
      end
    end

    describe "with invalid params" do
      let(:invalid) { { email: 'invalid@email.com', username: 'invalid@email.com', password: 'password', password_confirmation: 'password' } }

      it "assigns a newly created but unsaved user as @user" do
        # Trigger the behavior that occurs when invalid params are submitted
        post :create, { user: invalid }
        expect(assigns(:user)).to be_a_new(User)
        expect(assigns(:user)).not_to be_persisted
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        post :create, { user: invalid }
        expect(response).to render_template :new
      end
    end
  end

end
