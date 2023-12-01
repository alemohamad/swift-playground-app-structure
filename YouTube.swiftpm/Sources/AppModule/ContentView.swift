import SwiftUI
import ExampleKit

struct ContentView: View {
    @State private var name = ""
    @State private var birthDate = Date()
    @State private var greetingMessage = ""
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Person") {
                    HStack {
                        Text("Name")
                        TextField("Enter your name",
                                  text: $name)
                        .textFieldStyle(.roundedBorder)
                    }
                    
                    DatePicker("Birth date",
                               selection: $birthDate,
                               displayedComponents: .date)
                    
                    Button {
                        let person = Person(name: name, dateOfBirth: birthDate)
                        withAnimation { 
                            greetingMessage = person.greeting()
                        }
                    } label: {
                        Label("Greet the person!",
                              systemImage: "play.fill")
                    }
                }
                
                if !greetingMessage.isEmpty {
                    Section("Greeting") {
                        Text(greetingMessage)
                    }
                }
            }
            .navigationTitle("YouTube")
        }
    }
}
