require 'rails_helper'

RSpec.describe CalculationsController, type: :controller do

  describe "GET #loan_payment" do
    it "returns http success" do
      get :loan_payment
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #descriptive_statistics" do
    it "returns http success" do
      get :descriptive_statistics
      expect(response).to have_http_status(:success)
    end
  end

end
