require "rails_helper"

	RSpec.describe Order, :type => :model do
		context "validations" do
			it "if everything ok" do
		    order = build(:order)
		    expect(Order.count).to eq 0
		    expect{ order.save! }.not_to raise_error
		    expect(Order.count).to eq 1
		  end

		    it "if name missing" do
		    order = build(:order, name: nil)
		    expect(Order.count).to eq 0
		    expect{ order.save! }.to raise_error(ActiveRecord::RecordInvalid)
		    expect(Order.count).to eq 0
		  end

			it "if email invalid" do
		    order = build(:order, email: "Johngmail.com")
		    expect(Order.count).to eq 0
		    expect{ order.save! }.to raise_error(ActiveRecord::RecordInvalid)
		    expect(Order.count).to eq 0
		  end
			
			it "if number invalid" do
		    order = build(:order, phone_number: "23gghg234")
		    expect(Order.count).to eq 0
		    expect{ order.save! }.to raise_error(ActiveRecord::RecordInvalid)
		    expect(Order.count).to eq 0
		  end

		  it "if pay type empty" do
		    order = build(:order, pay_type: nil)
		    expect(Order.count).to eq 0
		    expect{ order.save! }.to raise_error(ActiveRecord::RecordInvalid)
		    expect(Order.count).to eq 0
		  end

		  it "if pay type empty" do
		    order = build(:order, address: nil)
		    expect(Order.count).to eq 0
		    expect{ order.save! }.to raise_error(ActiveRecord::RecordInvalid)
		    expect(Order.count).to eq 0
		  end


	end
end