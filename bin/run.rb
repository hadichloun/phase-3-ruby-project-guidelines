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
                # menu
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
        if login_choice == "Sign Up"
            new_username = prompt.ask("Create account with your Email.".light_yellow, required: true)
            new_password = prompt.ask("Create a password.".light_yellow, required: true)
            new_first_name = prompt.ask("What is your first name?".light_yellow, required: true)
            new_last_name = prompt.ask("What is your last name?".light_yellow, required: true) do |a|
                a.validate(/^(?=.*[0-9]).{1,4}$/)
                a.messages[:valid?] = "Invalid, try again."
end
login
