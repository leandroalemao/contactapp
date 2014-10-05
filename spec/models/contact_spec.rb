describe Contact do 
	it "has a valid factory" do 
		expect(FactoryGirl.create(:contact)).to be_valid
	end
	it "is invalid without a firstname" do
		expect(FactoryGirl.build(:contact, first_name: nil)).to be_valid
	end
	it "is invalid without a lastname" do
		expect(FactoryGirl.build(:contact, last_name: nil)).to be_valid
	end
	it "returns a contact's full name as a string" do
		contact = FactoryGirl.build(:contact, first_name: "John", last_name: "Doe") 
		expect(contact.name).to eq "John Doe"
	end

	describe "filter last name by letter" do
		before :each do 
			@smith = FactoryGirl.create(:contact, last_name: "Smith") 
			@jones = FactoryGirl.create(:contact, last_name: "Jones") 
			@johnson = FactoryGirl.create(:contact, last_name: "Johnson") 
		end

		context "matching letters" do
			it "returns a sorted array of results that match" do 
				expect(Contact.by_letter("J")).to eq [@johnson, @jones]
			end
		end

		context "non-matching letters" do
			it "returns a sorted array of results that match" do 
				expect(Contact.by_letter("J")).to_not include @smith
			end
		end
	end
end