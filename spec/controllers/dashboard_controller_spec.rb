require 'rails_helper'

RSpec.describe DashboardController, type: :controller do
  login_user

  describe "GET #index" do
    context "when user is logged in" do

      it "then returns http success" do
        get :index
        expect(response).to have_http_status(:success)
      end

      it "should have a current_user" do
        expect(subject.current_user).to_not eq(nil)
      end
    end
  end

end
