class Product < ApplicationRecord
    validates :name, presence: true
    scope :published, -> { where(published: true) }
end
