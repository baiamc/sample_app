require 'spec_helper'

describe "Static Pages" do

  describe "Home Page" do
    
    it "has the content 'Sample App'" do
      visit '/static_pages/home'
      page.should have_selector('h1', text: 'Sample App')
    end

    it "has the title 'Home'" do
      visit '/static_pages/home'
      find('title').native.text.should eq 'Ruby on Rails Tutorial Sample App | Home'
    end
  end

  describe "Help Page" do

    it "has the content 'Help'" do
      visit '/static_pages/help'
      page.should have_selector('h1', text: 'Help')
    end

    it "has the title 'Help'" do
      visit '/static_pages/help'
      find('title').native.text.should eq 'Ruby on Rails Tutorial Sample App | Help'
    end
  end

  describe "About Page" do

    it "has the content 'About Us'" do
      visit '/static_pages/about'
      page.should have_selector('h1', text: 'About Us')
    end

    it "has the title 'About Us'" do
      visit '/static_pages/about'
      find('title').native.text.should eq 'Ruby on Rails Tutorial Sample App | About Us'
    end
  end
end
