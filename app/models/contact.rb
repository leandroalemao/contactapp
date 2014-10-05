class Contact < ActiveRecord::Base

	def name
		[first_name, last_name].join " "
	end

	def self.by_letter(letter) 
		where("last_name LIKE ?", "#{letter}%").order(:last_name) 
	end

end
