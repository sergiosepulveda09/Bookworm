//
//  AddBookView.swift
//  Bookworm
//
//  Created by Sergio Sepulveda on 2021-07-22.
//

import SwiftUI

struct AddBookView: View {
    @Environment(\.managedObjectContext) private var moc
    @Environment(\.presentationMode) var presentationMode
    
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genre = ""
    @State private var review = ""
    @State private var date = Date()
    var disabledCondition: Bool {
        if title.isEmpty || author.isEmpty || genre.isEmpty {
            return true
        }
        return false
    }
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Name of book", text: $title)
                    TextField("Author's name", text: $author)
                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section {
                    RatingView(rating: $rating)
                    
                    TextField("Write a review", text: $review)
                }
                
                Section {
                    Button("Save") {
                        let newBook = Book(context: self.moc)
                        newBook.title = self.title
                        newBook.author = self.author
                        newBook.rating = Int16(self.rating)
                        newBook.genre = self.genre
                        newBook.review = self.review
                        newBook.date = self.date
                        try? self.moc.save()
                        self.presentationMode.wrappedValue.dismiss()
                    }
                }
                .disabled(disabledCondition)
                
                
            }.navigationBarTitle("Add book")
        }
    }

}

struct AddBookView_Previews: PreviewProvider {
    static var previews: some View {
        AddBookView()
    }
}
