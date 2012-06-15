require 'spec_helper'

describe User do
  
  before(:each) do
    @attr = { :name => "Example User", :email => "user@example.com"}
  end
  
  it "should create a new instance given valid attributes" do
    User.create!(@attr)
  end
  
  it "should require a name" do
    no_name = User.new(@attr.merge(:name => ""))
    no_name.should_not be_valid
  end
  
  it "should requir an email address" do
    no_email = User.new(@attr.merge(:email => ""))
    no_email.should_not be_valid
  end
  
  it "should reject names that are too long" do
    long_name = "a"*51
    lnu = User.new(@attr.merge(:name => long_name))
    lnu.should_not be_valid
  end
  
  it "should accept valid email addresses" do
    addresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
    addresses.each do |a|
      veu = User.new(@attr.merge(:email => a))
      veu.should be_valid
    end
  end
  
  it "should rject invalid email addresses" do
    addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
    addresses.each do |a|
      veu = User.new(@attr.merge(:email => a))
      veu.should_not be_valid
    end
  end
  
  it "should reject duplicate email addresses" do
    User.create!(@attr)
    uwde = User.new(@attr)
    uwde.should_not be_valid
  end
  
  it "should reject email address identical up to case" do
    ue = @attr[:email].upcase
    User.create!(@attr.merge(:email => ue))
    uwde = User.new(@attr)
    uwde.should_not be_valid
  end
end
