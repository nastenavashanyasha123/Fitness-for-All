#!/usr/bin/env ruby

# Fitness for All
# A program to help you stay fit and healthy!

#set up classes for fitness tracking
class Exercise
  attr_accessor :name, :duration, :intensity
  def initialize (name, duration, intensity)
    @name = name
    @duration = duration
    @intensity = intensity
  end
end

class Workout
  attr_accessor :name, :exercises, :duration
  def initialize(name, exercises, duration)
    @name = name
    @exercises = exercises
    @duration = duration
  end
end

# create exercises
running = Exercise.new("running", 30, "strong")
pushups = Exercise.new("pushups", 10, "medium")
squats = Exercise.new("squats", 15, "medium")

# create a workout
morning_workout = Workout.new("my morning workout", [running, pushups, squats], 45)

# print info about the workout
puts "Workout name: #{morning_workout.name}"
puts "Duration: #{morning_workout.duration} minutes"
puts "Exercises: #{morning_workout.exercises.map(&:name).join(', ')}"

#puts info about the exercises
morning_workout.exercises.each do |exercise|
  puts "Name: #{exercise.name}"
  puts "Duration: #{exercise.duration} minutes"
  puts "Intensity: #{exercise.intensity}"
  puts ""
end

# add stretching as a warm-up exercise
stretching = Exercise.new("stretching", 5, "light")
morning_workout.exercises.unshift(stretching)

# print out the exercises
morning_workout.exercises.each do |exercise|
  puts "Name: #{exercise.name}"
  puts "Duration: #{exercise.duration} minutes"
  puts "Intensity: #{exercise.intensity}"
  puts ""
end

#update the total duration of the workout
morning_workout.duration = morning_workout.exercises.inject(0) { |sum, exercise| sum + exercise.duration }
puts "Updated duration of workout: #{morning_workout.duration} minutes"

# create a new exercise
swimming = Exercise.new("swimming", 30, "strong")

# add swimming to the morning workout
morning_workout.exercises << swimming

# print out the exercises and duration again
puts "Workout name: #{morning_workout.name}"
puts "Duration: #{morning_workout.duration} minutes"
puts "Exercises: #{morning_workout.exercises.map(&:name).join(', ')}"

#update the total duration of the workout again
morning_workout.duration = morning_workout.exercises.inject(0) { |sum, exercise| sum + exercise.duration }
puts "Updated duration of workout: #{morning_workout.duration} minutes"

#method to print out workout
def print_workout (workout)
  puts "Workout name: #{workout.name}"
  puts "Duration: #{workout.duration} minutes"
  puts "Exercises:"
  workout.exercises.each do |exercise|
    puts "- #{exercise.name} (#{exercise.duration} minutes, intensity: #{exercise.intensity})"
  end
end

#print out the workout
print_workout(morning_workout)

#method to add a rest period
def add_rest(workout, duration)
  # create a new exercise for rest
  rest = Exercise.new("rest", duration, "none")
  # add the rest exercise to the workout
  workout.exercises << rest
  # update the total duration of the workout
  workout.duration += duration
end

#add a rest period to the workout
add_rest(morning_workout, 10)

#print out the workout again
print_workout(morning_workout)