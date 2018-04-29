class Group < ActiveRecord::Base
	validates :name,  presence: true, length: { in: 6..30 }
	validates :description, presence: true, length: { in: 11..60 }
	
	belongs_to :user
	belongs_to :admin, :class_name => "User", :foreign_key => :admin_id

	has_many :joins
	has_many :users, through: :joins

end
