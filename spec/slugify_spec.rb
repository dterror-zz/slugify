require File.dirname(__FILE__) + '/spec_helper'

describe "Slugify" do
  
  before(:all) do
    setup_db
    class Person < ActiveRecord::Base;slugify(:name);end
    class Character < ActiveRecord::Base;set_table_name('people');slugify(:non_existant);end
    class Article < ActiveRecord::Base;slugify(:title, :slug_field => :permalink);end
  end
    
  it "should generate a slug for the specified attr" do
    jacob = Person.create(:name => 'Jacob Black')
    jacob.slug.should == 'jacob-black'
  end
  
  it "should trow a readable exception on specifying a non existant attribute" do
    begin
      Character.create(:name => 'Jacob Black')
    rescue Exception => e
      e.clean_message.should match(/slugify/)
    end
  end
  
  describe "With options" do
    it "should accept :slug_field option" do
      myartc = Article.create(:title => "My Article")
      myartc.permalink.should == 'my-article'
    end
  end
  
  
end