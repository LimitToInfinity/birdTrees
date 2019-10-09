class Tree < ApplicationRecord
    has_many :bird_trees
    has_many :birds, through: :bird_trees

    validates :species, uniqueness: true
end
