class Product < ApplicationRecord
    has_rich_text :description
    has_one_attached :featured_image
    belongs_to :brand

    validates :name, presence: true
    validates :inventory, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
    validates :price, numericality: { greater_than_or_equal_to: 0 }
    
    scope :published, -> { where(published: true) }

    before_validation :set_default_brand

    private

    def set_default_brand
      self.brand ||= Brand.default
    end
end
