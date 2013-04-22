class Instructor < ActiveRecord::Base
	validates :nombre, :presence => true,
	  :length => { :maximum => 80 }

	validates :email, :presence => true,
	 :uniqueness => true,
	 :format => { :with => /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

	validates :cedula, :presence => true,
	:length => { :minimum => 6, :maximum => 15 },
	:numericality => true

	
  has_many :horarios
  attr_accessible :cedula, :direccion, :email, :nombre, :materia_id

  def self.search(search)
	where('nombre like ? or direccion like? or cedula like? or email like?', "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
	end

end
