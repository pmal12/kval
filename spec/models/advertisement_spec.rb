require "rails_helper"

	RSpec.describe Advertisement, :type => :model do
		context "validations" do
			it "if everything ok" do
		    advertisement = build(:advertisement)
		    expect(Advertisement.count).to eq 0
		    expect{ advertisement.save! }.not_to raise_error
		    expect(Advertisement.count).to eq 1
		  end

		  
			it "title missing" do
		    advertisement = build(:advertisement, title: nil)
		    expect(Advertisement.count).to eq 0
		    expect{ advertisement.save! }.to raise_error(ActiveRecord::RecordInvalid)
		    expect(Advertisement.count).to eq 0
		  end

		  
			it "file missing" do
		    advertisement = build(:advertisement, image_file_name: nil)
		    expect(Advertisement.count).to eq 0
		    expect{ advertisement.save! }.to raise_error(ActiveRecord::RecordInvalid)
		    expect(Advertisement.count).to eq 0
		  end

		  
			it "wrong file type" do
		    advertisement = build(:advertisement, image_content_type: "HHH")
		    expect(Advertisement.count).to eq 0
		    expect{ advertisement.save! }.to raise_error(ActiveRecord::RecordInvalid)
		    expect(Advertisement.count).to eq 0
		  end
		    

		context "methods" do
			it "destroys " do
				advertisement = create(:advertisement)
				expect(Advertisement.count).to eq 1
				expect{ advertisement.destroy! }.not_to raise_error
				expect(Advertisement.count).to eq 0
			end
		end

	end
end