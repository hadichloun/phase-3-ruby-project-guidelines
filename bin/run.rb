require_relative '../config/environment'

def welcome
    title = Artii::Base.new(:font => "slant")
    puts title.asciify("EPIC WORKOUT")
    puts "Welcome to EPIC WORKOUT!
    EPIC WORKOUT CLI app allows you to build or choose a full body workout, you can save workouts and access other users 
    workouts. Please login to continue or sign up to make an account!" 
end

welcome





# prompt = TTY::Prompt.new
# current_user = nil

# name_response = prompt.ask('What is your name?')

# puts name_response

# menu_choice = prompt.select('What would you like to do?', ["Login", "Signup"])

# if menu_choice === "Login"
#     user_name = prompt.ask("Email:")
#     password = prompt.mask("Password:")


#     current_user = User.all.find { |user| user.email === user_name && user.password === password }

#     puts "Hello #{current_user.email}!!!!"

#     doctor_choice = prompt.select("Select a doctor below:", Doctor.all)
#     date_choice = prompt.select("Choose a date", [Date.parse("10/10/2010"), Date.parse("10/11/2010"), Date.parse("10/12/2010")])

#     appt_confirmation = prompt.select("Are you sure you want to book an appt with #{doctor_choice.name} at #{date_choice}?", ["Yes", "No"])

#     if appt_confirmation === "Yes"
#         Appointment.create(doctor_id: doctor_choice.id, patient_id: current_user.id, date: date_choice)

#         puts "Your appoitment has been booked!"
#     end

# end
