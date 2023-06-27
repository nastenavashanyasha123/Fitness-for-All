class FitnessForAll
  # Initialize the class with no parameters
  def initialize
    @exercises = []
    @diet_strategies = []
    @motivations = []
  end

  # Add exercise to the class
  def add_exercise(exercise)
    @exercises << exercise
  end

  # Add diet strategy to the class
  def add_diet_strategy(strategy)
    @diet_strategies << strategy
  end

  # Add motivation tip to the class
  def add_motivation(motivation)
    @motivations << motivation
  end

  # List all exercises in the class
  def list_exercises
    puts "Fitness For All Exercise List"
    @exercises.each do |exercise|
      puts "- #{exercise}"
    end
  end

  # List all diet strategies in the class
  def list_diet_strategies
    puts "Fitness For All Diet Strategies"
    @diet_strategies.each do |strategy|
      puts "- #{strategy}"
    end
  end

  # List all motivations in the class
  def list_motivations
    puts "Fitness For All Motivations"
    @motivations.each do |motivation|
      puts "- #{motivation}"
    end
  end
end