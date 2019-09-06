# allows you to execute ./build.sh without the bash keyword
chmod +x ./build.sh
# copy across files to distribution directory
mkdir burger-terminal-app
cp ./burger.rb ./burger-terminal-app
cp ./ascii.rb ./burger-terminal-app
# install all gems
gem install colorize 
gem install tty-prompt
gem install tty-font
gem install rubocop
gem install pry


### These are the gems and files required to run my terminal app. The colorize and font gem just allow the app to look better when you run it. The prompt gem is used throughout the app where the user inputs their order. This gem allows less coding for user error as they can only choose from the options available and not input their own, leaving room for mistakes.

## My app doesn't require multiple files in the directory as everything is in the one file. If i was to use classes and ojects I would of used multiple files to avoid the main file being too cluttered with hard coded information. 