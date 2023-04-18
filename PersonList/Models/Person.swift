struct Person {
    let firstName: String
    let lastName: String
    let phone: String
    let email: String
    
    var contact: String {
        "\(firstName) \(lastName)"
    }
}

class DataManager {
    static let shared = DataManager()
    
    var firstNames = ["Alice", "Bob", "Charlie", "David", "Emma", "Frank", "Grace", "Henry", "Isabel", "John"]
    var lastNames = ["Anderson", "Brown", "Carter", "Davis", "Edwards", "Fisher", "Garcia", "Harris", "Ingram", "Johnson"]
    var emails = ["alice@example.com", "bob@example.com", "charlie@example.com", "david@example.com", "emma@example.com", "frank@example.com", "grace@example.com", "henry@example.com", "isabel@example.com", "john@example.com"]
    var phones = ["555-1111", "555-2222", "555-3333", "555-4444", "555-5555", "555-6666", "555-7777", "555-8888", "555-9999", "555-0000"]
    
    
    func getPeople() -> [Person] {
        var people = [Person]()
        
        for _ in 0..<10 {
            let firstName = firstNames.randomElement()!
            let lastName = lastNames.randomElement()!
            let email = emails.randomElement()!
            let phone = phones.randomElement()!
            
            let person = Person(firstName: firstName, lastName: lastName, phone: phone, email: email)
            
            if !people.contains(where: { $0 == person }) {
                people.append(person)
            }
        }
        
        return people
    }
    }

extension Person: Equatable {
    static func == (lhs: Person, rhs: Person) -> Bool {
        return lhs.firstName == rhs.firstName &&
            lhs.lastName == rhs.lastName &&
            lhs.email == rhs.email &&
            lhs.phone == rhs.phone
    }
}
