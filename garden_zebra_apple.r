#Fitness for All

#1
# Create a data frame for tracking the fitness of different individuals
fitness_df <- data.frame("Name" = character(),
                        "Age" = integer(),
                        "Height" = double(),
                        "Weight" = double(),
                        "Heart Rate" = integer(),
                        "Cholesterol" = integer(),
                        "Blood Pressure" = integer(),
                        "Body Fat Percentage" = double())

#2
# Read in the data of different individuals
fitness_data <- read.csv("fitness_data.csv", header = TRUE)

#3
# Add the fitness data to the data frame
fitness_df <- rbind(fitness_df, fitness_data)

#4
# Calculate Body Mass Index for each individual
fitness_df$BMI <- with(fitness_df, (Weight/((Height/100)^2)))

#5
# Calculate the resting metabolic rate for each individual
fitness_df$RMR <- with(fitness_df, (10*Weight) + (6.25*Height) - (5*Age) + 5)

#6
# Add a column to the data frame for the activity level of each individual
fitness_df$ActivityLevel <- character()

#7 
# Create a function to calculate the total daily energy expenditure
calculate_TDEE <- function(age, height, weight, activity_level){
  rmr <- 10*weight + 6.25*height - 5*age + 5
  if (activity_level == "sedentary"){
    tdee <- rmr * 1.2
  } else if (activity_level == "lightly active"){
    tdee <- rmr * 1.375
  } else if (activity_level == "moderately active"){
    tdee <- rmr * 1.55
  } else if (activity_level == "very active"){
    tdee <- rmr * 1.725
  } else {
    tdee <- rmr * 1.9
  }
  return(tdee)
}

#8
# Create a for loop to populate the ActivityLevel column and then calculate the TDEE for each individual
for(i in 1:nrow(fitness_df)){
  if(fitness_df$Age[i] < 19){
    fitness_df$ActivityLevel[i] <- "lightly active"
  } else if (fitness_df$Age[i] >= 19 & fitness_df$Age[i] < 30){
    fitness_df$ActivityLevel[i] <- "moderately active"
  } else if (fitness_df$Age[i] >= 30 & fitness_df$Age[i] < 50){
    fitness_df$ActivityLevel[i] <- "very active"
  } else {
    fitness_df$ActivityLevel[i] <- "extra active"
  }
  fitness_df$TDEE[i] <- calculate_TDEE(fitness_df$Age[i], fitness_df$Height[i], 
                                      fitness_df$Weight[i], fitness_df$ActivityLevel[i])
}

#9
# Create a function to calculate the number of calories to eat to gain/lose weight
calculate_calories <- function(tdee, goal){
  if(goal == "lose"){
    calories <- tdee - 500
  } else if (goal == "gain"){
    calories <- tdee + 500
  } else {
    calories <- tdee
  }
  return(calories)
}

#10
# Create a column in the data frame for the number of calories to eat
fitness_df$Calories <- integer()

#11
# Create a for loop to populate the Calories column
for(i in 1:nrow(fitness_df)){
  fitness_df$Calories[i] <- calculate_calories(fitness_df$TDEE[i], fitness_df$Goal[i])
}

#12
# Create a function to calculate the recommended macronutrient ratio
calculate_macronutrient_ratio <- function(protein, fat, carbs){
  protein_ratio <- protein/calories
  fat_ratio <- fat/calories
  carb_ratio <- carbs/calories
  return(c(protein_ratio, fat_ratio, carb_ratio))
}

#13
# Add columns to the data frame for the macronutrient ratios
fitness_df$ProteinRatio <- double()
fitness_df$FatRatio <- double()
fitness_df$CarbRatio <- double()

#14
# Create a for loop to populate the macronutrient ratio columns
for(i in 1:nrow(fitness_df)){
  macronutrient_ratio <- calculate_macronutrient_ratio(fitness_df$Protein[i], fitness_df$Fat[i], fitness_df$Carbohydrates[i])
  fitness_df$ProteinRatio[i] <- macronutrient_ratio[1]
  fitness_df$FatRatio[i] <- macronutrient_ratio[2]
  fitness_df$CarbRatio[i] <- macronutrient_ratio[3]
}

#15
# Create a function to calculate the number of servings of each food group
calculate_servings <- function(calories, protein, fat, carbs){
  protein_servings <- protein/7
  fat_servings <- fat/9
  carb_servings <- carbs/4
  return(c(protein_servings, fat_servings, carb_servings))
}

#16
# Add columns to the data frame for the food group servings
fitness_df$ProteinServings <- double()
fitness_df$FatServings <- double()
fitness_df$CarbServings <- double()

#17
# Create a for loop to populate the food group serving columns
for(i in 1:nrow(fitness_df)){
  servings <- calculate_servings(fitness_df$Calories[i], fitness_df$Protein[i], fitness_df$Fat[i], fitness_df$Carbohydrates[i])
  fitness_df$ProteinServings[i] <- servings[1]
  fitness_df$FatServings[i] <- servings[2]
  fitness_df$CarbServings[i] <- servings[3]
}

#18
# Create a function to calculate the recommended number of servings of each food group based on the macronutrient ratios
calculate_recommended_servings <- function(calories, protein_ratio, fat_ratio, carb_ratio){
  protein_servings <- (protein_ratio*calories)/7
  fat_servings <- (fat_ratio*calories)/9
  carb_servings <- (carb_ratio*calories)/4
  return(c(protein_servings, fat_servings, carb_servings))
}

#19
# Add columns to the data frame for the recommended food group servings
fitness_df$RecommendedProteinServings <- double()
fitness_df$RecommendedFatServings <- double()
fitness_df$RecommendedCarbServings <- double()

#20
# Create a for loop to populate the recommended food group serving columns
for(i in 1:nrow(fitness_df)){
  servings <- calculate_recommended_servings(fitness_df$Calories[i], fitness_df$ProteinRatio[i],
                                             fitness_df$FatRatio[i], fitness_df$CarbRatio[i])
  fitness_df$RecommendedProteinServings[i] <- servings[1]
  fitness_df$RecommendedFatServings[i] <- servings[2]
  fitness_df$RecommendedCarbServings[i] <- servings[3]
}

#21
# Calculate the total number of calories consumed each day
fitness_df$TotalCalories <- with(fitness_df, (Protein+Fat+Carbohydrates)*4)

#22
# Create a function to calculate the caloric deficit/surplus
calculate_caloric_deficit <- function(tdee, total_calories){
  caloric_deficit <- tdee - total_calories
  return(caloric_deficit)
}

#23
# Add a column for the caloric deficit/surplus
fitness_df$CaloricDeficit <- double()

#24
# Create a for loop to populate the caloric deficit/surplus column
for(i in 1:nrow(fitness_df)){
  fitness_df$CaloricDeficit[i] <- calculate_caloric_deficit(fitness_df$TDEE[i], fitness_df$TotalCalories[i])
}

#25
# Create a function to calculate the percentage of calories from each macronutrient
calculate_percentage_calories <- function(protein, fat, carbs, total_calories){
  protein_percentage <- (protein*4)/total_calories
  fat_percentage <- (fat*9)/total_calories
  carb_percentage <- (carbs*4)/total_calories
  return(c(protein_percentage, fat_percentage, carb_percentage))
}

#26
# Add columns for the percentage of calories from each macronutrient
fitness_df$ProteinPercentage <- double()
fitness_df$FatPercentage <- double()
fitness_df$CarbPercentage <- double()

#27
# Create a for loop to populate the macronutrient percentage columns
for(i in 1:nrow(fitness_df)){
  percentages <- calculate_percentage_calories(fitness_df$Protein[i], fitness_df$Fat[i],
                                              fitness_df$Carbohydrates[i], fitness_df$TotalCalories[i])
  fitness_df$ProteinPercentage[i] <- percentages[1]
  fitness_df$FatPercentage[i] <- percentages[2]
  fitness_df$CarbPercentage[i] <- percentages[3]
}

#28
# Create a function to calculate the difference between recommended and actual macronutrient percentages
calculate_percentage_difference <- function(actual, recommended){
  difference <- actual - recommended
  return(difference)
}

#29
# Add columns for the difference in macronutrient percentages
fitness_df$ProteinPercentageDifference <- double()
fitness_df$FatPercentageDifference <- double()
fitness_df$CarbPercentageDifference <- double()

#30
# Create a for loop to populate the macronutrient percentage difference columns
for(i in 1:nrow(fitness_df)){
  differences <- calculate_percentage_difference(fitness_df$ProteinPercentage[i], fitness_df$RecommendedProteinRatio[i])
  fitness_df$ProteinPercentageDifference[i] <- differences[1]
  differences <- calculate_percentage_difference(fitness_df$FatPercentage[i], fitness_df$RecommendedFatRatio[i])
  fitness_df$FatPercentageDifference[i] <- differences[2]
  differences <- calculate_percentage_difference(fitness_df$CarbPercentage[i], fitness_df$RecommendedCarbRatio[i])
  fitness_df$CarbPercentageDifference[i] <- differences[3]
}

#31
# Create a function to calculate the average time spent exercising each week
calculate_average_exercise_time <- function(days_per_week, minutes_per_day){
  average_time <- (days_per_week*minutes_per_day)/7
  return(average_time)
}

#32
# Add a column for the average time spent exercising each week
fitness_df$AverageExerciseTime <- double()

#33
# Create a for loop to populate the AverageExerciseTime column
for(i in 1:nrow(fitness_df)){
  fitness_df$AverageExerciseTime[i] <- calculate_average_exercise_time(fitness_df$DaysPerWeek[i], fitness_df$MinutesPerDay[i])
}

#34
# Create a function to calculate the hours of sleep each night
calculate_sleep_hours <- function(bed_time, wake_time){
  sleep_time <- wake_time - bed_time
  return(sleep_time)
}

#35
# Add a column for the average sleep hours each night
fitness_df$AverageSleepHours <- double()

#36
# Create a for loop to populate the AverageSleepHours column
for(i in 1:nrow(fitness_df)){
  fitness_df$AverageSleepHours[i] <- calculate_sleep_hours(fitness_df$BedTime[i], fitness_df$WakeTime[i])
}

#37
# Create a function to calculate the average number of steps taken each day
calculate_steps_per_day <- function(walk_minutes, step_count){
  steps_per_day <- (walk_minutes*step_count)/60
  return(steps_per_day)
}

#38
# Add a column for the average number of steps taken each day
fitness_df$AverageStepsPerDay <- double()

#39
# Create a for loop to populate the AverageStepsPerDay column
for(i in 1:nrow(fitness_df)){
  fitness_df$AverageStepsPerDay[i] <- calculate_steps_per_day(fitness_df$WalkMinutes[i], fitness_df$StepCount[i])
}

#40
# Create a function to calculate the percentage of water drank each day
calculate_water_percentage <- function(ounces, total_fluids){
  percentage <- (ounces/total_fluids)*100
  return(percentage)
}

#41
# Add a column for the percentage of water drank each day
fitness_df$WaterPercentage <- double()

#42
# Create a for loop to populate the WaterPercentage column
for(i in 1:nrow(fitness_df)){
  fitness_df$WaterPercentage[i] <- calculate_water_percentage(fitness_df$OuncesWater[i], fitness_df$TotalFluids[i])
}

#43
# Create a function to calculate the average rating of perceived exertion
calculate_rpe <- function(workout_intensity, length_session){
  rpe <- (workout_intensity*length_session)/5
  return(rpe)
}

#44
# Add a column for the average rating of perceived exertion
fitness_df$AverageRPEScore <-