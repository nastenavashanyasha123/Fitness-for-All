#include <iostream> 
using namespace std; 
  
// Function to Calculate BMI 
float calculateBMI(float w, float h) 
{ 
    float bmi = w / (h * h); 
    return bmi; 
} 
  
// Function to Calculate BMR 
float calculateBMR(float w, float h, int age, char gender) 
{ 
    float bmr; 
    if (gender == 'M') 
        bmr = (66.47 + (13.7 * w) + (5.0 * h) - (6.76 * age)); 
    else
        bmr = (655.1 + (9.6 * w) + (1.8 * h) - (4.7 * age)); 
    return bmr; 
} 
  
// Function to Calculate Calorie Intake 
float calorieIntake(float bmr) 
{ 
    return bmr * 1.4; 
} 
  
// Main Function 
int main() 
{ 
    float weight, height, bmi, bmr, calorie; 
    int age; 
    char gender; 
  
    // Ask for User Inputs 
    cout << "Enter Weight in Kgs: "; 
    cin >> weight; 
    cout << "Enter Height in cms: "; 
    cin >> height; 
    cout << "Enter Age: "; 
    cin >> age; 
    cout << "Enter Gender (M/F): "; 
    cin >> gender; 
  
    // Calculate BMI 
    bmi = calculateBMI(weight, height / 100); 
    cout << "\nYour BMI is " << bmi << endl; 
  
    // Calculate BMR 
    bmr = calculateBMR(weight, height, age, gender); 
    cout << "Your BMR is " << bmr << endl; 
  
    // Calculate Calorie Intake 
    calorie = calorieIntake(bmr); 
    cout << "Your calorie intake should be " << calorie << endl; 
  
    // Printing Fitness Level 
    if (bmi < 18.5) 
        cout << "\nYou are Underweight"; 
    else if (bmi > 18.5 && bmi < 24.9) 
        cout << "\nYou are Healthy"; 
    else if (bmi > 25 && bmi < 29.9) 
        cout << "\nYou are Overweight"; 
    else
        cout << "\nYou are Obese"; 
  
    return 0; 
}