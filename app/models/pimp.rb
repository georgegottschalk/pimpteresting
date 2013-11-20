class Pimp < ActiveRecord::Base
	belongs_to :user

	attr_accessible :image

	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
	
end
