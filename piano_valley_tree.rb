#!/usr/bin/env ruby

# This program is designed to promote physical fitness for all ages and genders.

# Set up variables
age = 0
gender = ""
target_heart_rate = 0
exercises = []

# Welcome message
puts "Welcome to the Fitness for All program!"

# Ask for user input
print "Please enter your age: "
age = gets.chomp.to_i

print "Please enter your gender (m or f): "
gender = gets.chomp.downcase

# Calculate target heart rate
if age >= 18
  target_heart_rate = 220 - age
else
  target_heart_rate = 205 - (age * 2)
end

# Add exercises
exercises << "jogging"
exercises << "walking"
exercises << "swimming"
exercises << "cycling"
exercises << "squats"
exercises << "planks"
exercises << "push-ups"
exercises << "sit-ups"
exercises << "leg-raises"
exercises << "lunges"

# Output results
puts "Your age is #{age} and your gender is #{gender}."
puts "Your target heart rate is #{target_heart_rate} BPM."
puts "Here is a list of exercises for you:" 
exercises.each {|exercise| puts exercise}

# Ask user to select exercises
puts "Please select three exercises from the list to complete your workout:"
exercise1 = gets.chomp
exercise2 = gets.chomp
exercise3 = gets.chomp

# Generate workout routine
puts "Great! Here is your workout:"
puts "Exercise 1: #{exercise1}"
puts "Exercise 2: #{exercise2}"
puts "Exercise 3: #{exercise3}"

# Ask user to track target heart rate while exercising
puts "Remember to track your target heart rate while exercising (at least #{target_heart_rate} BPM)."

# End message
puts "Congratulations on completing your workout! Enjoy the health benefits of physical fitness."