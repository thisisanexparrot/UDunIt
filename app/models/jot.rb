class Jot < ActiveRecord::Base
	has_many :goals
	validates :title, presence: true, length: {minimum: 5}
end
