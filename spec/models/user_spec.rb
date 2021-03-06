require 'spec_helper'

describe User do

  it "has a valid Factory" do
    FactoryGirl.create(:user).should be_valid
  end

  let(:user) { FactoryGirl::create(:user)}

  it {should validate_presence_of :email}

  it {should have_many :auctions}
  it {should have_many :userevents}
  it {should have_many :bids}
  it {should have_many :invitations}

  it "returns correct fullname" do
    user = FactoryGirl.create(:user)
    user.fullname.should eq "#{user.forename} #{user.surname}"
  end

  it "returns correct display_name" do
    user = FactoryGirl.create(:user)
    user.display_name.should eq user.fullname
  end

  it "returns correct name" do
    user = FactoryGirl.create(:user)
    user.name.should eq user.nickname
  end

  it "adds 100 ffp for registering a non legal entity user" do
    user = FactoryGirl.create(:user, :legal_entity => false)
    Ffp.find_by_user_id(user.id).price.should eq 100
    Ffp.find_by_user_id(user.id).activated.should eq true
  end

end