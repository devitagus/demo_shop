class Book < ActiveRecord::Base
  monetize :price_cents
end
