class Venue < ActiveRecord::Base
  has_and_belongs_to_many(:bands)

  validates(:description, :presence => true)
  validates(:address, :presence => true)


before_save(:titleize_description)

private

	def titleize_description
		self.description = description.titleize
	end
end
