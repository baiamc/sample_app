require 'spec_helper'

describe "AuthenticationPages" do
  subject { page }

  describe "signin page" do
    before { visit signin_path }

    it { should have_selector 'h1', 'Sign in' }
    specify { page_title.should include 'Sign in' }
    
    describe "with invalid authentication" do
      before { click_button "Sign in" }

      it { should have_selector 'div.alert.alert-error', 'Invalid' }
      describe "after visiting another page" do
        before { click_link "Home" }
        it { should_not have_selector 'div.alert.alert-error', 'Invalid' }
      end
    end

    describe "with valid authentication" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        fill_in "Email", with: user.email
        fill_in "Password", with: user.password
        click_button "Sign in"
      end

      specify { page_title.should include user.name }
      it { should have_link "Profile", href: user_path(user) }
      it { should have_link "Sign out", href: signout_path }
      it { should_not have_link "Sign in", href: signin_path }

      describe "followed by sign out" do
        before { click_link "Sign out" }
        it { should have_link "Sign in", href: signin_path }
      end
    end
  end
end
