#include <iostream>
#include <math.h>

using namespace std;

// define constants
const double PI = 3.14159;
const int GOAL = 10000;

// Step counter function
// this function increases the step count.
void incrementSteps(int &step_cnt) {
	step_cnt++;
}

// Distance calculator
// This function calculates the distance based on the number of steps taken
double calculateDistance(int step_cnt) {
    return step_cnt * 0.000762;
}

// Calories Burned Calculator
// This function calculates the total calories burned based on the number of steps taken, weight, and time
double calculateCaloriesBurned(int step_cnt, double weight, double time) {
	return (weight * 2.2) * (step_cnt / time) * 0.53;	
}

// Heart Rate Calculator
// This function calculates the average heart rate based on the number of steps taken
double calculateHeartRate(int step_cnt) {
	return ((step_cnt / (PI * 2.0)) * 60.0);
}

// Progress tracker
// This function keeps track of the progress of the user and prints out the current stats
void trackProgress(int step_cnt, double distance, double calories_burned, double heart_rate) {
	std::cout << "---------------------------------" << std::endl;
	std::cout << "Number of Steps: " << step_cnt << std::endl;
	std::cout << "Distance: " << distance << std::endl;
	std::cout << "Calories Burned: " << calories_burned << std::endl;
	std::cout << "Average Heart Rate: " << heart_rate << std::endl;
	std::cout << "---------------------------------" << std::endl;
}

// Main function
// This function is the main driver of the program and will run until the goal is reached.
int main() {
	
	// Declare variables
	int step_cnt = 0;
	double weight = 0;
	double time = 0;
	double distance = 0;
	double calories_burned = 0;
	double heart_rate = 0;
 
	// Get input from user
	std::cout << "Enter your current weight in lbs: " << std::endl;
	std::cin >> weight;
	
	std::cout << "Enter the time spent to reach your goal in minutes: " << std::endl;
	std::cin >> time;
	
	// Run program until goal is reached
	while(step_cnt < GOAL){
		incrementSteps(step_cnt);
		distance = calculateDistance(step_cnt);
		calories_burned = calculateCaloriesBurned(step_cnt, weight, time);
		heart_rate = calculateHeartRate(step_cnt);
		trackProgress(step_cnt, distance, calories_burned, heart_rate);
	}
		
	// Print out the final stats
	std::cout << "Congratulations! You have reached your goal of " << GOAL << " steps!" << std::endl;
	std::cout << "You've traveled a total of " << distance << " miles in " << time << " minutes!" << std::endl;
	std::cout << "You've burned a total of " << calories_burned << " calories!" << std::endl;

	return 0;
}