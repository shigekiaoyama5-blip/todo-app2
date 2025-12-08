class Task < ApplicationRecord
    has_rich_text :content
    belongs_to :user, optional: true
    validates :title, presence: true

    validates :description, presence: true
    validates :description, uniqueness: true

    has_many :comments, dependent: :destroy

    def author_name
        user.display_name
    end
end
