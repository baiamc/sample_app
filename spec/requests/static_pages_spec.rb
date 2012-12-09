require 'spec_helper'

describe "Static Pages" do

  let(:base_title) {'Ruby on Rails Tutorial Sample App'}

  describe "Home Page" do
    
    it "has the content 'Sample App'" do
      visit '/static_pages/home'
      page.should have_selector('h1', text: 'Sample App')
    end

    it "has the title 'Home'" do
      visit '/static_pages/home'
      find('title').native.text.should eq "#{base_title}"
    end
  end

  describe "Help Page" do

    it "has the content 'Help'" do
      visit '/static_pages/help'
      page.should have_selector('h1', text: 'Help')
    end

    it "has the title 'Help'" do
      visit '/static_pages/help'
      find('title').native.text.should eq "#{base_title} | Help"
    end
  end

  describe "About Page" do

    it "has the content 'About Us'" do
      visit '/static_pages/about'
      page.should have_selector('h1', text: 'About Us')
    end

    it "has the title 'About Us'" do
      visit '/static_pages/about'
      find('title').native.text.should eq "#{base_title} | About Us"
    end
  end

  describe "Contact Page" do

    it "has the content 'Contact'" do
      visit '/static_pages/contact'
      page.should have_selector 'h1', text: 'Contact'
    end

    it "has the title 'Contact'" do
      visit '/static_pages/contact'
      find('title').native.text.should eq "#{base_title} | Contact"
    end
  end
end
