require "rails_helper"

RSpec.describe User, :type => :model do
	context "validations" do
		context "save success" do
		  it "if name and passwords present" do
		    user = build(:user)
		    expect(User.count).to eq 0
		    expect{ user.save! }.not_to raise_error
		    expect(User.count).to eq 1
		  end

		  it "if names uniq" do
		  	create(:user)
		  	user = build(:user, name: "John2")
		  	expect(User.count).to eq 1
		    expect{ user.save! }.not_to raise_error
		    expect(User.count).to eq 2
		  end

		  it "if password confirmation matches password" do
		  	user = build(:user)
		  	expect(user.password).to eq(user.password_confirmation)
		  	expect(User.count).to eq 0
		    expect{ user.save! }.not_to raise_error
		    expect(User.count).to eq 1
		  end

	  end

	  context "save fail with message" do
			it "if name blank" do
		    user = build(:user, name: nil)
		    expect(User.count).to eq 0
		    expect{ user.save! }.to raise_error(ActiveRecord::RecordInvalid)
		    expect(User.count).to eq 0
		  end

		  it "if not names uniq" do
		  	create(:user)
		  	user = build(:user)
		  	expect(User.count).to eq 1
		    expect{ user.save! }.to raise_error(ActiveRecord::RecordInvalid)
		    expect(User.count).to eq 1
		  end

		  it "if password blank" do
		  	user = build(:user, password: nil)
		  	expect(User.count).to eq 0
		    expect{ user.save! }.to raise_error(ActiveRecord::RecordInvalid)
		    expect(User.count).to eq 0
		  end

		  it "if password confirmation doesnt match with password" do
		  	user = build(:user, password_confirmation: "John3")
		  	expect(user.password_confirmation).not_to eq(user.password)
		  	expect(User.count).to eq 0
		    expect{ user.save! }.to raise_error(ActiveRecord::RecordInvalid)
		    expect(User.count).to eq 0
		  end

	  end
		  
	end
	context "methods" do
		describe "#ensure_an_admin_remains" do
			it "ensures that last admin remains" do
				user = create(:user)
				expect(User.count).to eq 1
				expect{ user.destroy! }.to raise_error(RuntimeError, "Can't delete last user")
				expect(User.count).to eq 1
			end
		end
		
			it "user being deleted" do
				user = create(:user)
				user2 = create(:user, name:"janis", password:"janis", password_confirmation:"janis")
				expect(User.count).to eq 2
				user.destroy
				expect{ user.destroy! }.not_to raise_error
				expect(User.count).to eq 1
			end
		
	end
end