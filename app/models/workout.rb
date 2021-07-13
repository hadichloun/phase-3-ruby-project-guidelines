class Workout < ActiveRecord::Base
    has_many :users_workouts
    has_many :users, through: :users_workouts
    has_many :yogas
    has_many :cardios
    has_many :strengths
end