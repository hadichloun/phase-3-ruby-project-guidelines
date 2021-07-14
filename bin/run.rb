require_relative '../config/environment'

def welcome
    title = Artii::Base.new(:font => "epic")
    puts title.asciify("EPIC WORKOUT")
    puts "Welcome to EPIC WORKOUT!🏋️‍♂️🚴🧘‍♂️🏃‍♂️
    EPIC WORKOUT CLI app allows you to build or choose a full body workout, you can save workouts and access other users 
    workouts. Please login to continue or sign up to make an account!" .cyan
end

welcome

def login 
    users = User.all.map {|user| user.email}
    prompt = TTY::Prompt.new
    login_choice = prompt.select("What would you like to do?".blue, ["Login", "Sign Up", "Exit"])
        if login_choice == "Login"
            current_username = prompt.ask("What is your username?".green, required: true)
            current_password = prompt.mask("Enter your password.".green, required: true)
            if users.include?(current_username) && User.all.find_by(password: current_password)
                header = Artii::Base.new(:font => "slant")
                puts header.asciify("Let's Workout!")
                menu
            else
                puts "Incorrect username or password.".red
                try_again = prompt.select("Would you like to try again?".blue, ["Yes", "No"])
                if try_again == "Yes"
                    login
                elsif try_again == "No"
                    welcome
                    login
                end
            end
        end
        # if login_choice == "Sign Up"
        #     new_username = prompt.ask("Make a username.".light_yellow, required: true)
        #     new_password = prompt.ask("Make a password.".light_yellow, required: true)
        #     new_first_name = prompt.ask("What is your first name?".light_yellow, required: true)
        #     new_last_name = prompt.ask("What is your last name?".light_yellow, required: true) do |a|
        #         a.validate(/^(?=.*[0-9]).{1,4}$/)
        #         a.messages[:valid?] = "Invalid, try again."
        #         end
        #     age = prompt.ask("how old are you?".light_yellow, required: true) do |a|
        #         a.validate(/^(?=.*[0-9]).{4,4}$/)
        #         a.messages[:valid?] = "Invalid, please try again. Example: 21."
        #         end
        #     User.create(email: new_username, password: new_password, first_name: new_first_name, last_name: new_last_name, age: age)
        #     puts "New account made!".green
        #     welcome
        #     login
        # end
        # if login_choice == "Exit"
        #     exit!
        # end
end
login
























# def login 
#     users = User.all.map {|user| user.user_name}
#     prompt = TTY::Prompt.new
#     login_choice = prompt.select("What would you like to do?".blue, ["Login", "Sign Up", "Exit"])
#         if login_choice == "Login"
#             current_username = prompt.ask("What is your username?".green, required: true)
#             current_password = prompt.mask("Enter your password.".green, required: true)
#             if users.include?(current_username) && User.all.find_by(password: current_password)
#                 header = Artii::Base.new(:font => "slant")
#                 puts header.asciify("Let's Workout!")
#                 menu
#             else
#                 puts "Incorrect username or password.".red
#                 try_again = prompt.select("Would you like to try again?".blue, ["Yes", "No"])
#                 if try_again == "Yes"
#                     login
#                 elsif try_again == "No"
#                     welcome
#                     login
#                 end
#             end
#         end
#     end
#     login




# prompt = TTY::Prompt.new
# current_user = nil

# menu_choice = prompt.select('What would you like to do?', ["Login", "Signup", "exit"])

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
