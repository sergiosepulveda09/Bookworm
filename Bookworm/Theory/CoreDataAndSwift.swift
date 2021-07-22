//
//  CoreDataAndSwift.swift
//  Bookworm
//
//  Created by Sergio Sepulveda on 2021-07-21.
//

import SwiftUI

struct CoreDataAndSwift: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Student.entity() , sortDescriptors: []) var students: FetchedResults<Student>

    var body: some View {
        VStack {
            List {
                ForEach(students, id: \.id) { student in
                    Text(student.name ?? "Unknown")
                }
            }
            Button("Add") {
                let firstNames = ["Ginny", "Harry", "Hermione", "Luna", "Ron"]
                let lastNames = ["Granger", "Lovegood", "Potter", "Weasly"]
                let chosenFirstName = firstNames.randomElement() ?? "Unknown"
                let chosenLastName = lastNames.randomElement() ?? "Unknown"
                let student = Student(context: self.moc)
                student.id = UUID()
                student.name = "\(chosenFirstName) \(chosenLastName)"
                
                try? self.moc.save()
            }
        }
    }

}
struct CoreDataAndSwift_Previews: PreviewProvider {
    static var previews: some View {
        CoreDataAndSwift()
    }
}
