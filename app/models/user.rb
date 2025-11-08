class User < ApplicationRecord
  has_many :tasks, dependent: :destroy
  has_one :profile, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def has_written?(task)
    tasks.exists?(id: task.id)
  end

  def display_name
    self.email.split('@').first
  end

  def prepare_profile
    profile || build_profile
  end
end
