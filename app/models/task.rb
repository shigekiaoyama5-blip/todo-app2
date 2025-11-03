class Task < ApplicationRecord
    belongs_to :user, optional: true
    validates :title, presence: true

    validates :description, presence: true
    validates :description, uniqueness: true
end
