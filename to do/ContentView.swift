import SwiftUI
import SwiftData

struct ContentView: View {
    // 1. Get access to the database context for writing data
    @Environment(\.modelContext) private var modelContext
    
    // 2. Automatically fetch and sort items from the database
    @Query(sort: \TodoItem.createdAt, order: .reverse) private var items: [TodoItem]
        
    @State private var newTitle = ""
    
    var body: some View {
        NavigationStack {
            List {
                // Add New Item Section
                Section(header: Text("to do")
                    .bold()
                    .font(.system(size: 24))
                    .padding(.top, 10)
                    .padding(.bottom, -32)) {
                    
                }
                HStack {
                    TextField("to do item...", text: $newTitle)
                        .textInputAutocapitalization(.never)
                    Button("add") {
                        addItem()
                    }
                    .disabled(newTitle.isEmpty)
                }
                Section(header: Text("to do")) {
                    ForEach(items.filter { !$0.isCompleted}) { item in
                        HStack {
                            Button("") {
                                item.isCompleted.toggle()
                            }
                            Image(systemName: "circle.fill")
                                .foregroundColor(.white)
                                .strikethrough(item.isCompleted)
                                .foregroundColor(item.isCompleted ? .green : .primary)
                                .overlay(
                                    Circle()
                                        .stroke(.gray, lineWidth: 1) // Border color and thickness
                                )
                            Text(item.title)
                        }
                    }
                    .onDelete(perform: deleteItems) // Swipe-to-delete
                }
                Section(header: Text("completed")) {
                    ForEach(items.filter { $0.isCompleted}) { item in
                        HStack{
                            Button("") {
                                item.isCompleted.toggle()
                            }
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(.gray)
                                .strikethrough(item.isCompleted)
                                .foregroundColor(item.isCompleted ? .gray : .primary)
                            Text(item.title)
                        }
                    }
                    .onDelete(perform: deleteItems) // Swipe-to-delete
                }
            }
        }
        .navigationTitle("To Do")
    }
    // 3. Insert data into the database
    private func addItem() {
        let newItem = TodoItem(title: newTitle)
        modelContext.insert(newItem) // Saved to disk automatically
        newTitle = "" // Clear text field
    }
    // 4. Delete data from the database
    private func deleteItems(at offsets: IndexSet) {
        for index in offsets {
            let itemToDelete = items[index]
            modelContext.delete(itemToDelete) // Removed from disk
        }
    }
}
