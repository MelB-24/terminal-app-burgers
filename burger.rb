require_relative "ingredient-hash"
require 'colorize'
require 'tty-prompt'
prompt = TTY::Prompt.new

ingredients = [
    [{item: "Beef", cost: 3}],
    [{item: "Chicken", cost: 3}],
    [{item: "Lamb", cost: 4 }],
    [{item: "Vegetarian", cost: 3}],
    [{item: "No Patty", cost: 0}],
    [{item: "Cheddar", cost: 1}],
    [{item: "Tasty", cost: 1}],
    [{item: "Feta", cost: 2}],
    [{item: "No Cheese", cost: 0}],
    [{item: "Lettuce", cost: 1}],
    [{item: "Tomato", cost: 1}],
    [{item: "Onion", cost: 1}],
    [{item: "Mushroom", cost: 2}],
    [{item: "Avocado", cost: 3}],
    [{item: "Pickles", cost: 2}],
    [{item: "Egg", cost: 3}],
    [{item: "Beetroot", cost: 2}],
    [{item: "Ketchup", cost: 1}],
    [{item: "BBQ", cost: 1}],
    [{item: "House Sauce", cost: 1}],
    [{item: "Mustard", cost: 1}],
    [{item: "Sriracha", cost: 1}],
    [{item: "Aioli", cost: 1}],
    [{item: "Mayo", cost: 1}],
    [{item: "Chipotle", cost: 1}]
]

burger = []
burger_cost = 0

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
    burger_cost += ingredients[0][0][:cost]
when 
    patty == "Chicken"
    burger << "Chicken patty"
    burger_cost += ingredients[1][0][:cost]
when 
    patty == "Lamb"
    burger << "Lamb patty"
    burger_cost += ingredients[2][0][:cost]
when 
    patty == "Vegetarian"
    burger << "Vegetarian patty"
    burger_cost += ingredients[3][0][:cost]
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
    burger_cost += ingredients[5][0][:cost]
when 
    cheese == "Tasty"
    burger << "Tasty cheese"
    burger_cost += ingredients[6][0][:cost]
when 
    cheese == "Swiss"
    burger << "Swiss cheese"
    burger_cost += ingredients[7][0][:cost]
when 
    cheese == "Feta"
    burger << "Feta cheese"
    burger_cost += ingredients[8][0][:cost]
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
puts burger_cost