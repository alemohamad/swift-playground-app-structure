import Foundation

public class Person {
    var name: String
    var dateOfBirth: Date
    
    public init(name: String, dateOfBirth: Date) {
        self.name = name
        self.dateOfBirth = dateOfBirth
    }
    
    public func greeting() -> String {
        guard !name.isEmpty else {
            return ""
        }
        let calendar = Calendar.current
        let ageComponents = calendar.dateComponents([.year], from: dateOfBirth, to: Date())
        guard let age = ageComponents.year else { return "Hello \(name)!" }
        
        return "Hello \(name)!\nYou are \(age) years old."
    }
}
