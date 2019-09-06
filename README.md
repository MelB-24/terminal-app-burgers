# BURGER TERMINAL APP

## GitHub Link
- [Terminal Burger App GitHub](https://github.com/MelB-24/terminal-app-burgers)


In order to run this app you must follow the following steps.

1. You must have ruby installed on your machine. I have used homebrew to do this and `rbenv`

2. Clone the repository from GitHub
```txt
git clone <name>.git
```

3. `cd` into the directory you have cloned

4. Run the build shell script. This will install all gems and create all files that are required to run the app. 
```txt
bash build.sh
```

5. `cd` into the 'dist' directory

6. Run the following command 

```txt
ruby burger.rb
```

7. If wanting to run in advanced mode
```txt
ruby burger.rb -a <NAME>
```