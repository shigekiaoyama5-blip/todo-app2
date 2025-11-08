class Profile < ApplicationRecord
    enum :gender, { male: 0, female: 1, other: 2 }
    belongs_to :user

    def age
        return 'Unknown' unless birthday.present?
        years = Time.zone.now.year - birthday.year
        days = Time.zone.now.yday

        if days < 0
            "#{years - 1}years old"
        else
            "#{years}years old"
        end
    end
end
