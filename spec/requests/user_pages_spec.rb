require 'spec_helper'

describe "UserPages" do
  subject { page }

  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }

    it { should have_selector('h1',    text: user.name) }
    specify { page_title.should include user.name }
  end

  describe "signup" do

    before { visit signup_path }

    let(:submit) { "Create my account" }

    it { should have_selector('h1',    text: "Sign up") }
    specify { page_title.should include "Sign up" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end

      describe "has error messages" do
        before { click_button submit }
        it { should have_content "Name can't be blank" }
        it { should have_content "Email can't be blank" }
        it { should have_content "Password can't be blank" }
        it { should have_content "confirmation can't be blank" }
      end
    end

    describe "with valid information" do
      before do
        fill_in "Name",         with: "Example User"
        fill_in "Email",        with: "user@example.com"
        fill_in "Password",     with: "foobar"
        fill_in "Confirmation", with: "foobar"
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end

      describe "should redirect to profile page" do
        before { click_button submit }
        it { should have_selector '.alert-success', 'Welcome to the Sample App!' }
        specify { current_path.should == user_path(User.count) }
      end
    end
  end
end
