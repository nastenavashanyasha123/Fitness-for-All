// Objective: To ensure that everyone has access to fitness activities

// 1. Create a class to hold the necessary data for fitness events:
class FitnessEvent {
    var time: String = ""
    var location: String = ""
    var participants: Int = 0
    var cost: Double = 0.0
}

// 2. Create a class to store a list of event participants:
class EventParticipant {
    var name: String = ""
    var age: Int = 0
    var gender: String = ""
    var fitnessLevel: String = ""
}

// 3. Create a class to collect user information:
class UserInfo {
    var name: String = ""
    var age: Int = 0
    var gender: String = ""
    var fitnessLevel: String = ""
}

// 4. Create a class to store a list of available fitness events:
class FitnessEventsList {
    var events: MutableList<FitnessEvent> = mutableListOf()
    var participants: MutableList<EventParticipant>
    
    // 5. Create a method to add new events to the list:
    fun addEvent(time: String, location: String, cost: Double, participants: MutableList<EventParticipant>) {
        val event = FitnessEvent()
        event.time = time
        event.location = location
        event.cost = cost
        event.participants = participants.size
        this.events.add(event)
        this.participants = participants
    }
    
    // 6. Create a method to list all available events:
    fun listEvents() {
        for (event in events) {
            println("Time: ${event.time}, Location: ${event.location}, Cost: ${event.cost}, Participants: ${event.participants}")
        }
    }
    
    // 7. Create a method to register a user for a specific event:
    fun registerUser(userInfo: UserInfo, event: FitnessEvent) {
        val participant = EventParticipant()
        participant.name = userInfo.name
        participant.age = userInfo.age
        participant.gender = userInfo.gender
        participant.fitnessLevel = userInfo.fitnessLevel
        this.participants.add(participant)
    }
    
    // 8. Create a method to remove a user from a specific event:
    fun deregisterUser(userInfo: UserInfo, event: FitnessEvent) {
        for (participant in participants) {
            if (participant.name == userInfo.name &&
                    participant.age == userInfo.age &&
                    participant.gender == userInfo.gender &&
                    participant.fitnessLevel == userInfo.fitnessLevel) {
                this.participants.remove(participant)
            }
        }
    }
}

// 9. Create a class to store a list of free fitness events:
class FreeFitnessEventsList {
    var events: MutableList<FitnessEvent> = mutableListOf()
    var participants: MutableList<EventParticipant>
    
    // 10. Create a method to add new free events to the list:
    fun addFreeEvent(time: String, location: String, participants: MutableList<EventParticipant>) {
        val freeEvent = FitnessEvent()
        freeEvent.time = time
        freeEvent.location = location
        freeEvent.cost = 0.0
        freeEvent.participants = participants.size
        this.events.add(freeEvent)
        this.participants = participants
    }
    
    // 11. Create a method to list all available free events:
    fun listFreeEvents() {
        for (event in events) {
            println("Time: ${event.time}, Location: ${event.location}, Cost: ${event.cost}, Participants: ${event.participants}")
        }
    }
    
    // 12. Create a method to register a user for a specific free event:
    fun registerUserForFreeEvent(userInfo: UserInfo, event: FitnessEvent) {
        val participant = EventParticipant()
        participant.name = userInfo.name
        participant.age = userInfo.age
        participant.gender = userInfo.gender
        participant.fitnessLevel = userInfo.fitnessLevel
        this.participants.add(participant)
    }
    
    // 13. Create a method to remove a user from a specific free event:
    fun deregisterUserFromFreeEvent(userInfo: UserInfo, event: FitnessEvent) {
        for (participant in participants) {
            if (participant.name == userInfo.name &&
                    participant.age == userInfo.age &&
                    participant.gender == userInfo.gender &&
                    participant.fitnessLevel == userInfo.fitnessLevel) {
                this.participants.remove(participant)
            }
        }
    }
}

// 14. Create an interface to manage the available fitness events:
interface FitnessEventsManager {
    fun addEvent(event: FitnessEvent)
    fun listEvents()
    fun registerUser(userInfo: UserInfo, event: FitnessEvent)
    fun deregisterUser(userInfo: UserInfo, event: FitnessEvent)
    fun addFreeEvent(freeEvent: FitnessEvent)
    fun listFreeEvents()
    fun registerUserForFreeEvent(userInfo: UserInfo, freeEvent: FitnessEvent)
    fun deregisterUserFromFreeEvent(userInfo: UserInfo, freeEvent: FitnessEvent)
}

// 15. Create a class to implement the FitnessEventsManager interface:
class FitnessEventsManagerImpl() : FitnessEventsManager { 
    val eventsList = FitnessEventsList()
    val freeEventsList = FreeFitnessEventsList()

    override fun addEvent(event: FitnessEvent) {
        eventsList.addEvent(event.time, event.location, event.cost, event.participants)
    }
    
    override fun listEvents() {
        eventsList.listEvents()
    }
    
    override fun registerUser(userInfo: UserInfo, event: FitnessEvent) {
        eventsList.registerUser(userInfo, event)
    }
    
    override fun deregisterUser(userInfo: UserInfo, event: FitnessEvent) {
        eventsList.deregisterUser(userInfo, event)
    }
    
    override fun addFreeEvent(freeEvent: FitnessEvent) {
        freeEventsList.addFreeEvent(freeEvent.time, freeEvent.location, freeEvent.participants)
    }
    
    override fun listFreeEvents() {
        freeEventsList.listFreeEvents()
    }
    
    override fun registerUserForFreeEvent(userInfo: UserInfo, freeEvent: FitnessEvent) {
        freeEventsList.registerUserForFreeEvent(userInfo, freeEvent)
    }
    
    override fun deregisterUserFromFreeEvent(userInfo: UserInfo, freeEvent: FitnessEvent) {
        freeEventsList.deregisterUserFromFreeEvent(userInfo, freeEvent)
    }
}

// 16. Create a function to create a new FitnessEventsManager:
fun createNewFitnessEventsManager(): FitnessEventsManager {
    return FitnessEventsManagerImpl()
}

// 17. Create a function to query the available events:
fun queryAvailableEvents(eventsManager: FitnessEventsManager) {
    eventsManager.listEvents()
    eventsManager.listFreeEvents()
}

// 18. Create a function to register for a fitness event:
fun registerForFitnessEvent(eventsManager: FitnessEventsManager,
                            event: FitnessEvent, userInfo: UserInfo) {
    eventsManager.registerUser(userInfo, event)
}

// 19. Create a function to deregister from a fitness event:
fun deregisterFromFitnessEvent(eventsManager: FitnessEventsManager,
                               event: FitnessEvent, userInfo: UserInfo) {
    eventsManager.deregisterUser(userInfo, event)
}

// 20. Create a function to register for a free fitness event:
fun registerForFreeFitnessEvent(eventsManager: FitnessEventsManager,
                                freeEvent: FitnessEvent, userInfo: UserInfo) {
    eventsManager.registerUserForFreeEvent(userInfo, freeEvent)
}

// 21. Create a function to deregister from a free fitness event:
fun deregisterFromFreeFitnessEvent(eventsManager: FitnessEventsManager,
                                   freeEvent: FitnessEvent, userInfo: UserInfo) {
    eventsManager.deregisterUserFromFreeEvent(userInfo, freeEvent)
}

// 22. Create a function to check eligibility for a free fitness event:
fun checkEligibilityForFreeFitnessEvent(userInfo: UserInfo) {
    when (userInfo.age) {
        in 0..4 -> println("${userInfo.name} is eligible for a free fitness event!")
        5,6,7 -> println("${userInfo.name} is eligible for a free fitness event with parental supervision.")
        8..17 -> println("${userInfo.name} is eligible for a free fitness event with parental permission.")
        else -> println("${userInfo.name} is not eligible for a free fitness event.")
    }
}

// 23. Create a demo to test the classes and functions:
fun main(args: Array<String>) { 
    // Create a new FitnessEventsManager:
    val eventsManager = createNewFitnessEventsManager()

    // Add a few events:
    val event1 = FitnessEvent("6:00 pm", "Local Park", 20)
    val event2 = FitnessEvent("7:00 pm", "Gymnasium", 10)
    eventsManager.addEvent(event1)
    eventsManager.addEvent(event2)

    // Add a few free events:
    val freeEvent1 = FitnessEvent("8:00 pm", "Parking Lot", 0)
    val freeEvent2 = FitnessEvent("9:00 pm", "Indoor Pool", 0)
    eventsManager.addFreeEvent(freeEvent1)
    eventsManager.addFreeEvent(freeEvent2)

    // Query the available events:
    queryAvailableEvents(eventsManager)

    // Register for a fitness event:
    val userInfo1 = UserInfo("John Smith", 18, "Male", "Intermediate")
    registerForFitnessEvent(eventsManager, event1, userInfo1)

    // Register for a free fitness event:
    val userInfo2 = UserInfo("Jane Doe", 8, "Female", "Beginner")
    registerForFreeFitnessEvent(eventsManager, freeEvent1, userInfo2)
    
    // Check eligibility for a free fitness event:
    checkEligibilityForFreeFitnessEvent(userInfo2)
}