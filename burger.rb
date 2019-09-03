require 'colorize'
require 'tty-prompt'
prompt = TTY::Prompt.new

burger = []

p "Welcome to Mel's Burgers"
p "Let's start with a bun."
bun = prompt.yes?('Would you like a bun?')

case
when 
    bun == true
    burger << "Bun"
when 
    bun == false
    burger << "No bun"
end

patty_choices = %w[Beef Chicken Lamb Vegetarian None]
patty = prompt.select("Now which patty would you like on your burger?", patty_choices)

case
when 
    patty == "Beef"
    burger << "Beef patty"
when 
    patty == "Chicken"
    burger << "Chicken patty"
when 
    patty == "Lamb"
    burger << "Lamb patty"
when 
    patty == "Vegetarian"
    burger << "Vegetarian patty"
when 
    patty == "None"
    burger << "No patty"
end


cheese_choices = %w[Cheddar Tasty Swiss Feta None]
cheese = prompt.select("Next select which cheese you would like", cheese_choices)

case
when 
    cheese == "Cheddar"
    burger << "Cheddar cheese"
when 
    cheese == "Tasty"
    burger << "Tasty cheese"
when 
    cheese == "Swiss"
    burger << "Swiss cheese"
when 
    cheese == "Feta"
    burger << "Feta cheese"
when 
    cheese == "None"
    burger << "No cheese"
end



salad_choices = %w(Lettuce 
    Tomato
    Onion
    Mushroom
    Avocado
    Pickles
    Egg
    Beetroot
    )
salads = prompt.multi_select("Select all the salads you want!", salad_choices)

def separate_array(array, burger)
    array.map! do |ingredient|
        burger << ingredient
    end
end

separate_array(salads, burger)

sauce_choices = ["Ketchup",
    "BBQ",
    "House Sauce",
    "Mustard",
    "Sriracha",
    "Aioli",
    "Mayo",
    "Chipotle"
]
sauces = prompt.multi_select("Would you like any sauce?", sauce_choices)

separate_array(sauces, burger)
puts burger