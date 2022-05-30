class LineItem < ApplicationRecord
    belongs_to :book
    belongs_to :cart

  def total_price
    book.price.to_i * quantity.to_i
  end
end
