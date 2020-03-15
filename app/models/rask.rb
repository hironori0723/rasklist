class Rask < ApplicationRecord
    validates :status, presence: true, length: { in: 1..10 }
end
