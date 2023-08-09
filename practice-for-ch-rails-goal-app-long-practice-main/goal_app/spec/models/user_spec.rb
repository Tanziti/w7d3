require 'rails_helper'

RSpec.describe User, type: :model do
  subject {User.create!(username: "Dennis", password: "password")} #checking if we can create user

  it {should validate_presence_of(:username)}
  it {should validate_presence_of(:session_token)}
  it {should validate_presence_of(:password_digest)}
  it {should validate_length_of(:password).is_at_least(6)}
  it {should validate_uniqueness_of(:username)}
  it {should validate_uniqueness_of(:session_token)}


  describe "finds users by credentials" do
    context "with a valid username and password" do
      it "returns the proper user" do 
        zi = User.create(username: "zi", password: "wordpass")
        user = User.find_by_credentials("zi", "wordpass")
        expect(zi.username).to eq(user.username)
        expect(zi.password_digest).to eq(user.password_digest)
      end

      
    end


  end


end


