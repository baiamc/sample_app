require 'spec_helper'

describe "Static Pages" do
  subject { page }
  shared_examples_for "all static pages" do
    it { should have_selector 'h1', text: heading }
    specify { page_title.should eq full_title(title_piece) }
  end

  describe "Home Page" do
    before { visit root_path }
    let(:heading) { 'Sample App' }
    let(:title_piece) { '' }
    it_should_behave_like "all static pages"
  end

  describe "Help Page" do
    before { visit help_path }
    let(:heading) { 'Help' }
    let(:title_piece) { 'Help' }
    it_should_behave_like "all static pages"
  end

  describe "About Page" do
    before { visit about_path }
    let(:heading) { 'About Us' }
    let(:title_piece) { 'About Us' }
    it_should_behave_like "all static pages"
  end

  describe "Contact Page" do
    before { visit contact_path }
    let(:heading) { 'Contact' }
    let(:title_piece) { 'Contact' }
    it_should_behave_like "all static pages"
  end 
end
