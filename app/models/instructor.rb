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
  attr_accessible :cedula, :direccion, :email, :nombre, :materia_id, :imagen

  def self.search(search)
	where('nombre like ? or direccion like? or cedula like? or email like?', "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
	end
     
     # codigo para subir  imagenes 
   has_attached_file :imagen, :styles => { :small => "150x150>", :lsmall => "30x30>"},
  :url  => "/assets/instructores/:id/:style/:basename.:extension",
  :path => ":rails_root/public/assets/instructores/:id/:style/:basename.:extension"

  validates_attachment_presence :imagen
  validates_attachment_size :imagen, :less_than => 5.megabytes
  validates_attachment_content_type :imagen, :content_type => ['image/jpeg', 'image/png','image/jpg', 'image/gif']

end
