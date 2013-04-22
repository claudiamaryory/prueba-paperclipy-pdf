class Materia < ActiveRecord::Base

	validates :nombre, :presence => true,
	  :length => { :maximum => 80 }

	validates :sigla, :presence => true,
	  :length => { :maximum => 5 }

   
   has_many :horarios
   
  attr_accessible :nombre, :sigla
  	def self.search(search)
	where('nombre like ? or sigla like ?', "%#{search}%" , "%#{search}%")
	end
end
