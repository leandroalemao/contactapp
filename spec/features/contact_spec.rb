feature 'Contacts main page' do

	scenario "visits root path" do
		visit root_path
		expect(page).to have_content 'Contacts'
 		save_and_open_page
	end

	scenario "display the contacts in root page" do
		contact = FactoryGirl.create(:contact, first_name: 'Sam', last_name: 'Smith')
		visit root_path
		expect(page).to have_content 'Sam Smith'
		save_and_open_page
	end
end