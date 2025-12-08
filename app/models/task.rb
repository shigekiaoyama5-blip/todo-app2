class Task < ApplicationRecord
    has_rich_text :description
    belongs_to :user, optional: true
    validates :title, presence: true

    #validates :description, presence: true

    has_many :comments, dependent: :destroy

    def author_name
        user.display_name
    end
end
