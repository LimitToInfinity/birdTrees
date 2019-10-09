class Bird < ApplicationRecord
    has_many :bird_trees
    has_many :trees, through: :bird_trees

    validates :name, presence: true, uniqueness: true
    accepts_nested_attributes_for :trees, reject_if: proc { |attributes| attributes['species'].blank? }
end
