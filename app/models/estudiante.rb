class Estudiante < ActiveRecord::Base
	validates :nombre, :presence => true,
	  :length => { :maximum => 80 }

	validates :email, :presence => true,
	 :uniqueness => true,
	 :format => { :with => /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

	validates :cedula, :presence => true,
	:length => { :minimum => 6, :maximum => 15 },
	:numericality => true

	
  belongs_to :curso
  attr_accessible :cedula, :direccion, :email, :fcha_nacimiento, :nombre, :curso_id

def self.search(search)
where('nombre like ? or cedula like ? or direccion like ? or email like ? ',"%#{search}%" ,"%#{search}%","%#{search}%","%#{search}%")
end

end
