require 'pry'
require 'colorize'
require 'tty-prompt'
require 'tty-font'
require 'csv'
prompt = TTY::Prompt.new
font = TTY::Font.new(:standard)

burger = []
burger_cost = 0

puts font.write("Welcome to MelBurg")
puts "Let's start with a bun.".colorize(:magenta)

def handle_bun(bun, burger)
    case bun
    when true
        bun == true
        burger << "Bun"
    when false
        bun == false
        burger << "No bun"
    end
end 

def first_prompt(prompt, burger)
    begin
        bun = prompt.yes?('Would you like a bun?')  
        handle_bun(bun, burger)
    rescue => exception 
        first_prompt(prompt, burger)
    end
end 

first_prompt(prompt, burger)


patty_choices = [
    {item: "Beef", cost: 3},
    {item: "Chicken", cost: 3},
    {item: "Lamb", cost: 4 },
    {item: "Vegetarian", cost: 3},
    {item: "No Patty", cost: 0}
]

patty = prompt.select("Now which patty would you like on your burger?", patty_choices.map {|i| i[:item]})

case
when 
    patty == "Beef"
    burger << "Beef patty"
    burger_cost += patty_choices[0][:cost]
when 
    patty == "Chicken"
    burger << "Chicken patty"
    burger_cost += patty_choices[0][:cost]
when 
    patty == "Lamb"
    burger << "Lamb patty"
    burger_cost += patty_choices[0][:cost]
when 
    patty == "Vegetarian"
    burger << "Vegetarian patty"
    burger_cost += patty_choices[0][:cost]
when 
    patty == "None"
    burger << "No patty"
end

cheese_choices = [
    {item: "Cheddar", cost: 1},
    {item: "Tasty", cost: 1},
    {item: "Swiss", cost: 1},
    {item: "Feta", cost: 2},
    {item: "No Cheese", cost: 0}
]
cheese = prompt.select("Next select which cheese you would like", cheese_choices.map {|i| i[:item]})

case
when 
    cheese == "Cheddar"
    burger << "Cheddar cheese"
    burger_cost += cheese_choices[0][:cost]
when 
    cheese == "Tasty"
    burger << "Tasty cheese"
    burger_cost += cheese_choices[0][:cost]
when 
    cheese == "Swiss"
    burger << "Swiss cheese"
    burger_cost += cheese_choices[0][:cost]
when 
    cheese == "Feta"
    burger << "Feta cheese"
    burger_cost += cheese_choices[0][:cost]
when 
    cheese == "None"
    burger << "No cheese"
end


salad_choices = [
    {item: "Lettuce", cost: 1},
    {item: "Tomato", cost: 1},
    {item: "Onion", cost: 1},
    {item: "Mushroom", cost: 2},
    {item: "Avocado", cost: 3},
    {item: "Pickles", cost: 2},
    {item: "Egg", cost: 3},
    {item: "Beetroot", cost: 2}
]

salads = prompt.multi_select("Select all the salads you want!", salad_choices.map {|i| i[:item]})

def add_cost(options, choices_array, burger_cost)
    choices = []
    choices_array.each do |item|
        choice = options.find do |s|
            s[:item] == item
        end
        choices << choice
    end
    choices.each do |ingredient|
        burger_cost += ingredient[:cost]
    end
    burger_cost
end


add_cost(salad_choices, sal ads, burger_cost)


def separate_array(array, burger)
    array.map! do |ingredient|
        burger << ingredient
    end
end

separate_array(salads, burger)

sauce_choices = [
    {item: "Ketchup", cost: 1},
    {item: "BBQ", cost: 1},
    {item: "House Sauce", cost: 1},
    {item: "Mustard", cost: 1},
    {item: "Sriracha", cost: 1},
    {item: "Aioli", cost: 1},
    {item: "Mayo", cost: 1},
    {item: "Chipotle", cost: 1}
]
sauces = prompt.multi_select("Would you like any sauce?", sauce_choices.map {|i| i[:item]})

add_cost(sauce_choices, sauces, burger_cost)
separate_array(sauces, burger)

p "You're burger order is #{burger.join(", ")}"

#### this is where i want the ASCII art

CSV.open("burger-storage.csv", "a+") do |csv|
    csv << [burger_cost,burger.join(", ")]
end

p "Thanks for eating at Mel's Burgers!!!"