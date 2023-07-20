library(tidyverse)
library(ggplot2)

#import data
fitness <- read.csv("fitness.csv")
str(fitness)

#Calculate total #of fitness classes
totClasses <- sum(fitness$Class, na.rm=TRUE)

#Create a function to categorize class type
classType <- function(class){
  if(class == "Spin Class"){
    "Spin"
  }else if(class == "Aerobics"){
    "Aerobics"
  }else if(class == "Yoga"){
    "Yoga"
  }else if(class == "Zumba"){
    "Zumba"
  }else if(class == "Strength Training"){
    "Strength"
  }
}

#calculate proportion of each class type
propClasses <- fitness %>%
  group_by(Class) %>%
  summarise(Count = n()) %>%
  mutate(Percent = Count/totClasses*100)

#Visualize the data
propClasses$Class <- sapply(propClasses$Class, classType)

ggplot(propClasses, aes(x = Class, y = Percent, fill = Class)) +
  geom_col() +
  labs(title = "Fitness for All - Proportion of Classes",
       x = "Class Type",
       y = "Proportion (%)") +
  scale_fill_manual(values=c("#FFA500", "#FF9999", "#00BF87", "#FFCC00", "#99CCFF"))

#Calculate total #of attendees
totAttendees <- sum(fitness$Attendees, na.rm=TRUE)

#Calculate proportion of attendees for each class type
propAttendees <- fitness %>%
  group_by(Class) %>%
  summarise(Attendees = sum(Attendees)) %>%
  mutate(Percent = Attendees/totAttendees*100)

#Visualize the data
propAttendees$Class <- sapply(propAttendees$Class, classType)

ggplot(propAttendees, aes(x = Class, y = Percent, fill = Class)) +
  geom_col() +
  labs(title = "Fitness for All - Proportion of Attendees",
       x = "Class Type",
       y = "Proportion (%)") +
  scale_fill_manual(values=c("#FFA500", "#FF9999", "#00BF87", "#FFCC00", "#99CCFF"))

#Calculate total #of classes held
totClassesHeld <- sum(fitness$ClassesHeld, na.rm=TRUE)

#Calculate proportion of classes held for each class type
propClassesHeld <- fitness %>%
  group_by(Class) %>%
  summarise(ClassesHeld = sum(ClassesHeld)) %>%
  mutate(Percent = ClassesHeld/totClassesHeld*100)

#Visualize the data
propClassesHeld$Class <- sapply(propClassesHeld$Class, classType)

ggplot(propClassesHeld, aes(x = Class, y = Percent, fill = Class)) +
  geom_col() +
  labs(title = "Fitness for All - Proportion of Classes Held",
       x = "Class Type",
       y = "Proportion (%)") +
  scale_fill_manual(values=c("#FFA500", "#FF9999", "#00BF87", "#FFCC00", "#99CCFF"))

#Calculate average #of people per class
avgPeople <- fitness %>%
  group_by(Class) %>%
  summarise(Number = mean(Attendees, na.rm=TRUE))

#Visualize the data
avgPeople$Class <- sapply(avgPeople$Class, classType)

ggplot(avgPeople, aes(x = Class, y = Number, fill = Class)) +
  geom_col() +
  labs(title = "Fitness for All - Average # of People per Class",
       x = "Class Type",
       y = "Average # of People") +
  scale_fill_manual(values=c("#FFA500", "#FF9999", "#00BF87", "#FFCC00", "#99CCFF"))

#Calculate average # of classes per day
avgClasses <- fitness %>%
  group_by(Class) %>%
  summarise(Classes = mean(ClassesHeld, na.rm=TRUE))

#Visualize the data
avgClasses$Class <- sapply(avgClasses$Class, classType)

ggplot(avgClasses, aes(x = Class, y = Classes, fill = Class)) +
  geom_col() +
  labs(title = "Fitness for All - Average # of Classes per Day",
       x = "Class Type",
       y = "Average # of Classes") +
  scale_fill_manual(values=c("#FFA500", "#FF9999", "#00BF87", "#FFCC00", "#99CCFF"))

#Calculate proportion of classes attended
propAttended <- fitness %>%
  mutate(PctAttended = Attendees/ClassesHeld * 100) %>%
  group_by(Class) %>%
  summarise(Percent = mean(PctAttended, na.rm=TRUE))

#Visualize the data
propAttended$Class <- sapply(propAttended$Class, classType)

ggplot(propAttended, aes(x = Class, y = Percent, fill = Class)) +
  geom_col() +
  labs(title = "Fitness for All - Proportion of Classes Attended",
       x = "Class Type",
       y = "Proportion (%)") +
  scale_fill_manual(values=c("#FFA500", "#FF9999", "#00BF87", "#FFCC00", "#99CCFF"))

#Calculate average time of classes
avgTime <- fitness %>%
  group_by(Class) %>%
  summarise(Time = mean(Time, na.rm=TRUE))

#Visualize the data
avgTime$Class <- sapply(avgTime$Class, classType)

ggplot(avgTime, aes(x = Class, y = Time, fill = Class)) +
  geom_col() +
  labs(title = "Fitness for All - Average Length of Classes",
       x = "Class Type",
       y = "Average Length (minutes)") +
  scale_fill_manual(values=c("#FFA500", "#FF9999", "#00BF87", "#FFCC00", "#99CCFF"))