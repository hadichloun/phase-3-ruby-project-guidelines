require_relative '../config/environment'

def welcome
    title = Artii::Base.new(:font => "epic")
    puts title.asciify("EPIC WORKOUT").blue
    puts "Welcome to EPIC WORKOUT!🏋️‍♂️🚴🧘‍♂️🏃‍♂️
    EPIC WORKOUT CLI app allows you to build or choose a full body workout, you can save workouts and access other users 
    workouts. Please login to continue or sign up to make an account!" .blue
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
            new_last_name = prompt.ask("What is your last name?".light_yellow, required: true) 
            age = prompt.ask("how old are you?".light_yellow, required: true) 
            User.create(email: new_username, password: new_password, first_name: new_first_name, last_name: new_last_name, age: age)
            puts "New account made!".green
            welcome
            login
        end
        if login_choice == "Exit"
            exit!
        end
end

def menu
    options = TTY::Prompt.new
    menu_choice = options.select("Please select one of the following", ["Start a new workout", "Look at my account details", "Exit app"])
        if menu_choice == "Start a new workout"
            a_new_workout = TTY::Prompt.new
            build_or_start = a_new_workout.select("would like to create your workout or select from the list?".blue, ["Select from list", "create a new workout", "Go back to profile"])
            if build_or_start == "Select from list"
                select_from_gallery
            elsif build_or_start == "Create a new workout"
                make_new_workout
            elsif build_or_start == "Go back to profile"
                menu
            end
        elsif menu_choice == "Look at my account Information"
            a_prompt = TTY::Prompt.new
            account_prompt = a_prompt.select("What would you like to do?".blue, ["Look at my profile", "Change my username", "Change my password", "Delete my account", "Go back to menu"])
                if account_prompt == "Look at my profile"
                    look_at_profile
                elsif account_prompt == "Change my username"
                    change_username
                elsif account_prompt == "Change my password"
                    change_password
                elsif account_prompt == "Delete my account"
                    delete_account
                elsif account_prompt == "Go back to menu"
                    menu
                end
        elsif menu_choice == "Exit"
            exit!
        end
end























login       
welcome
# intensity_options
menu

 
