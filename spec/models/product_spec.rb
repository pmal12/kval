require "rails_helper"

	RSpec.describe Product, :type => :model do
		context "validations" do
			it "if everything ok" do
		    product = build(:product)
		    expect(Product.count).to eq 0
		    expect{ product.save! }.not_to raise_error
		    expect(Product.count).to eq 1
		  end

		  
			it "title missing" do
		    product = build(:product, title: nil)
		    expect{ product.save! }.to raise_error(ActiveRecord::RecordInvalid)
		    expect(Product.count).to eq 0
		  end

		  
			it "title not unique" do
			create(:product)
		    product = build(:product)
		    expect{ product.save! }.to raise_error(ActiveRecord::RecordInvalid)
		    expect(Product.count).to eq 1
		  end

		  
			it "price not a number" do
		    product = build(:product, price: "asd")
		    expect{ product.save! }.to raise_error(ActiveRecord::RecordInvalid)
		    expect(Product.count).to eq 0
		  end

		  it "price smalller than 0.01" do
		    product = build(:product, price: '0')
		    expect{ product.save! }.to raise_error(ActiveRecord::RecordInvalid)
		    expect(Product.count).to eq 0
		  end

		  it "if category missing" do
		    product = build(:product, category_id: nil)
		    expect{ product.save! }.to raise_error(ActiveRecord::RecordInvalid)
		    expect(Product.count).to eq 0
		  end

		  it "if file type wrong" do
		    product = build(:product, image_content_type: "HHH")
		    expect{ product.save! }.to raise_error(ActiveRecord::RecordInvalid)
		    expect(Product.count).to eq 0
		  end

		    

		context "methods" do
			it "destroys " do
				product = create(:product)
				expect(Product.count).to eq 1
				expect{ product.destroy! }.not_to raise_error
				expect(Product.count).to eq 0
			end

		
		end
	end
end