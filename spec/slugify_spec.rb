require File.dirname(__FILE__) + '/spec_helper'

describe "Slugify" do
  
  before(:all) do
    setup_db
    class Person < ActiveRecord::Base;slugify(:name);end
  end
    
  it "should generate a slug for the specified attr" do
    jacob = Person.create(:name => 'Jacob Black')
    jacob.slug.should == 'jacob-black'
  end
  
  
end