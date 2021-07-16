Yoga.destroy_all
Cardio.destroy_all
Strength.destroy_all
User.destroy_all
UsersWorkout.destroy_all
Workout.destroy_all


#Yoga
yoga1 = Yoga.create(name: "Yoga Core", intensity: "Intermidate", duration: 10.0)
yoga2 = Yoga.create(name: "Essential Strength Yoga", intensity: "Beginner", duration: 23.0)
yoga3 = Yoga.create(name: "Foundational Yoga Flow", intensity: "Advanced",  duration: 36.0)
#Cardio
cardio1 = Cardio.create(name: "The Jogging Military", intensity: "Advanced", duration: 8.0)
cardio2 = Cardio.create(name: "Sprints", intensity: "Intermediate", duration: 2.0)
cardio3 = Cardio.create(name: "Bicycle", intensity: "Advanced",  duration: 1.0)
#Strength
strength1 = Strength.create(name: "Push & Pull Basics", intensity: "Beginner", duration: 24.0)
strength2 = Strength.create(name: "Super Upper Body Stregth", intensity: "Intermidate", duration: 30.0)
strength3 = Strength.create(name: "Leg Power-Up", intensity: "Advanced",  duration: 37.0)
#Users
hadi = User.create(email: "hadi@gmail", password: "123", first_name: "hadi", last_name: "chloun", age: 98)
nala = User.create(email: "curiousk@gmail", password: "123", first_name: "Nala", last_name: "Curious", age: 36)
michael = User.create(email: "mj@gmail", password: "123", first_name: "Michael", last_name: "Jordan", age: 23)
#Workout
workout1 = Workout.create(name: "the beginner style", workout_type: "Full Body", yoga_id: yoga2.id, cardio_id: cardio1.id, strength_id: strength3.id)
workout2 = Workout.create(name: "intermediate training", workout_type: "Full Body", yoga_id: yoga3.id, cardio_id: cardio3.id, strength_id: strength2.id)
workout3 = Workout.create(name: "the imposible training", workout_type: "Full Body", yoga_id: yoga1.id, cardio_id: cardio2.id, strength_id: strength1.id)
#User_Workouts
UsersWorkout.create(name: michael, workouts_id: workout1.id, total_duration: 6, favorites: nil)
UsersWorkout.create(name: hadi, workouts_id: workout2.id, total_duration: 10, favorites: nil)
UsersWorkout.create(name: nala, workouts_id: workout3.id, total_duration: 1, favorites: nil)

