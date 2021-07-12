This will be a GREAT and ENJOYABLE project!!!

5 Models

workout fit App:

As a user, I want to be able to create a workout (type), save it to the database
as a user, I want to enter my name to retrieve my workouts
as a user, I can full crud my account


* user
user has many user_workouts 
user has many workouts thru user_workouts

user: 
t.string email
t.string password
t.string first_name
t.string last_name
t.integer age

----------------------------------------------------------------------------------------------------------

                
* user_workouts
belongs_to user
belongs_to workout

user_workout: 
t.string name 
t.integer user_id
t.integer workouts_id
t.string favorites 

-----------------------------------------------------------------------------------------------------------
* workout 
has_many user_workouts
has_many users thru user_workout
has_many yoga
has_many cardio
has_many strength

workout:
t.string name 
t.string workout_type 
t.integer yoga_id 
t.integer cardio_id 
t.integer strength_id

------------------------------------------------------------------------------------------------------------
* yoga 
belongs to workout

yoga: 
t.string name 
t.string instensity 
t.integer duration

---------------------------------------------------------------------------------------------------------------
* cardio 
belongs_to workout

cardio: 
t.string name 
t.string instensity 
t.integer duration

-------------------------------------------------------------------------------------------------------------
* strength 
belongs_to workout

strength:
t.string name 
t.string instensity 
t.integer duration

------------------------------------------------------------------------------------------------------------



* MVP Deliverables 
user can browse/select by workout type
user can make an account  
user can  create their own workout 
user can update their info
user can look at their account/portfolio


* Stretch Deliverables 
connect to front-end 
user can leave a review 
have the most reviewd workout 
user can delete account






