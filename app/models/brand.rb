class Brand < ApplicationRecord
  has_many :products, dependent: :restrict_with_error
  
  validates :name, presence: true, uniqueness: true
  
  # Class method to get or create default brand
  def self.default
    find_or_create_by!(name: 'Generic') do |brand|
      brand.description = 'Default brand for products'
    end
  end
end 