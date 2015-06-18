class Band < ActiveRecord::Base
    has_and_belongs_to_many(:venues)

    validates(:name, :presence => true)
    validates(:genre, :presence => true)

    before_save(:titleize_name)

    private

    def titleize_name 
    	self.name = name.titleize
    	
    end
  end
