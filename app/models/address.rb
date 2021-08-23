class Address < ApplicationRecord
	belongs_to :neighborhood, optional: true
	validates :zipcode, presence: true
	validates :zipcode, uniqueness: true
	validates :address, presence: true

	before_save :check_informations

	attr_accessor :neigh, :city, :state

	def check_informations
		state = State.find_or_create_by(name: self.state) if !self.state.blank?
		city = City.find_or_create_by(name: self.city, state_id: state.id) if !self.city.blank?
		neigh = Neighborhood.find_or_create_by(name: self.neigh, city_id: city.id) if !self.neigh.blank?
		self.neighborhood_id = neigh.id if !self.neigh.blank?
	end

	def get_neighborhood
		if !self.neighborhood.nil?
			return self.neighborhood.name
		else
			return "-"
		end
	end

	def get_city
		if !self.neighborhood.nil?
			if !self.neighborhood.city.nil?
				return self.neighborhood.city.name
			else
				return "-"
			end
		else
			return "-"
		end
	end
	def get_state
		if !self.neighborhood.nil?
			if !self.neighborhood.city.nil?
				if !self.neighborhood.city.state.nil?
					return self.neighborhood.city.state.name
				else
					return "-"	
				end
			else
				return "-"
			end
		else
			return "-"
		end
	end
end
