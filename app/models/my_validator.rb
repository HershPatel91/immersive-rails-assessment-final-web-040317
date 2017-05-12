class MyValidator < ActiveModel::Validator

	def validate(record)
		unless record.rating < 6 && record.rating > 0
			record.errors[:rating] << "Need a rating between 1 and 5!"
		end
	end

end