require "rails_helper"

RSpec.describe Category, :type => :model do
	context "validations" do
		context "save success" do
		  it "if all ok" do
		    category = build(:category)
		    expect(Category.count).to eq 0
		    expect{ category.save! }.not_to raise_error
		    expect(Category.count).to eq 1
		  end

		  it "if name missing" do
		    category = build(:category, name: nil)
		    expect(Category.count).to eq 0
		    expect{ category.save! }.to raise_error(ActiveRecord::RecordInvalid)
		    expect(Category.count).to eq 0
		  end

		  it "if not unique" do
		  	create(:category)
		    category = build(:category)
		    expect{ category.save! }.to raise_error(ActiveRecord::RecordInvalid)
		    expect(Category.count).to eq 1
		  end
		  
	  end
		  
	end
	context "methods" do
		
			# it "destroy com" do
			# 	user = create(:user)
			# 	expect(User.count).to eq 1
			# 	expect{ user.destroy! }.to raise_error(RuntimeError, "Can't delete last user")
			# 	expect(User.count).to eq 1
			# end
		
		
			it "category being deleted" do
				category = create(:category)
				expect{ category.destroy! }.not_to raise_error
				expect(Category.count).to eq 0
			end
		
	end
end