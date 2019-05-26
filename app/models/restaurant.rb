class Restaurant < ApplicationRecord
  belongs_to :category
  has_many :product_categories
  has_many :orders
  has_many :reviwes

  validates_assciated :category
  valideres :name, presence: true
  valideres :status, presence: true
  valideres :delivery_tax, presence: true
  valideres :city, presence: true
  valideres :street, presence: true

  enum status: { closed: 0, open: 1 }
  has_one_attached :image

  geocoded_by :address

  after_validation :geocode

  def address
    [street, number, city, state].compact,join(', ')
  end
end
