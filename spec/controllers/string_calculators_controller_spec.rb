require 'rails_helper'

RSpec.describe StringCalculatorsController, type: :controller do
  describe "GET #new" do
    it "renders the new template" do
      get :new
      expect(response).to render_template(:new)
    end

    it "assigns @result" do
      get :new
      expect(assigns(:result)).to be_nil
    end
  end

  describe "POST #create" do
    context "with valid input" do
      it "redirects to new_string_calculator_path with result" do
        post :create, params: { calculator: { numbers: "1,2,3" } }
        expect(response).to redirect_to(new_string_calculator_path(result: 6))
      end
    end

    context "with invalid input" do
      it "redirects to new_string_calculator_path with error message" do
        post :create, params: { calculator: { numbers: "1,-2,3" } }
        expect(response).to redirect_to(new_string_calculator_path(error: "Negative numbers not allowed: -2"))
      end
    end
  end
end