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
            current_username = prompt.ask("What is your email?".green, required: true)
            current_password = prompt.mask("Enter your password.".green, required: true)
            if users.include?(current_username) && User.all.find_by(password: current_password)
                header = Artii::Base.new(:font => "slant")
                puts header.asciify("Enjoy your Workout!")
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
    menu_choice = options.select("Please select one of the following", ["Workout", "Look at my account details", "Exit app"])
        if menu_choice == "Workout"
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




def select_from_gallery
    prompt_workouts = TTY::Prompt.new
        workouts = Workout.all
        workout_choice = prompt_workouts.select("choose your workout.".blue) do |menu|
            workouts.each do |object|
                menu.choice "#{object.name}", object
            end
        end
    puts "Great choice! This is a #{workout_choice.workout_type} workout.".blue
    prompt_start = TTY::Prompt.new
    start_workout = prompt_start.select("Would you like to start your workout?".blue, ["let's do it!", "nahh too hard!"])
    if start_workout == "let's do it!"
        x1 = workout_choice.yoga_id
        x2 = workout_choice.cardio_id
        x3 = workout_choice.strength_id
        
        #grabbing object by the id from above^
        yoga_obj = Yoga.all.select{|object| object.id == x1}
        cardio_obj = Cardio.all.select{|object| object.id == x2}
        strength_obj = Strength.all.select{|object| object.id == x3}
    

        #grabbing yoga attributes by mapping
        yoga_obj_name = yoga_obj.map{|object| object.name}
        cardio_obj_intensity = cardio_obj.map{|object| object.intensity}
        strength_obj_duration = strength_obj.map{|object| object.duration}

        #grabbing cardio attributes by mapping
        yoga_obj_name = yoga_obj.map{|object| object.name}
        yoga_obj_intensity =yoga_obj.map{|object| object.intensity}
        yoga_obj_duration = yoga_obj.map{|object| object.duration}
        #grabbing stretch attributes by mapping

        cardio_obj_name = cardio_obj.map{|object| object.name}
        cardio_obj_intensity = cardio_obj.map{|object| object.intensity}
        cardio_obj_duration = cardio_obj.map{|object| object.duration}

        #grabbing shoulders attributes by mapping
        strength_obj_name = strength_obj.map{|object| object.name}
        strength_obj_intensity = strength_obj.map{|object| object.intensity}
        strength_obj_duration = strength_obj.map{|object| object.duration}
        

        x_prompt = TTY::Prompt.new
        puts_prompt = x_prompt.select("how would you like to workout? virtually or at the gym facility?".blue, ["virtually!", "I'll head to the gym!"])
        if puts_prompt == "virtually!"
        puts  "PLEASE be prepared via zoom at 8:00 central time, make sure you have plenty of space for this amazing workout! This workout has Yoga exercise called #{yoga_obj_name}, it is a #{yoga_obj_intensity} intensity exercise that lasts for #{yoga_obj_duration} minute(s). 
        This workout has an #{cardio_obj_name}, it is a #{cardio_obj_intensity} intensity exercise that lasts for #{cardio_obj_duration} minute(s). Let's get going! 
        One of the important duties before workout is strength #{strength_obj_name}, it is a #{strength_obj_intensity} intensity exercise that lasts for #{strength_obj_duration} minute(s). nice!.".magenta
        menu
        elsif puts_prompt == "I'll head to the gym!"
        puts "Please make your way to yoga room, first exercise called #{yoga_obj_name} that is a #{yoga_obj_intensity} intensity level exercise, do this for #{yoga_obj_duration} minute(s).".magenta
        puts "Please make your way to cardio room, first exercise called #{cardio_obj_name} that is a #{cardio_obj_intensity} intensity level exercise, do this for #{cardio_obj_duration} minute(s).".magenta
        puts "Please make your way to strength room, first exercise called #{strength_obj_name} that is a #{strength_obj_intensity} intensity level exercise, do this for #{strength_obj_duration} minute(s).".magenta
        menu
        end
    elsif start_workout == "No"
        menu
    end
end




















login       
welcome
# intensity_options
menu

 
