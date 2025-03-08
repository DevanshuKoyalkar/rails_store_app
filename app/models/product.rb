class Product < ApplicationRecord
    has_rich_text :description
    has_one_attached :featured_image
    validates :name, presence: true
    validates :inventory, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
    validates :price, numericality: { greater_than_or_equal_to: 0 }
    scope :published, -> { where(published: true) }
end
