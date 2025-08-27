//
//  ContentView.swift
//  Wishlist
//
//  Created by Jourdese Palacio on 8/27/25.
//  CommitName: Alert Presentation

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var wishes: [Wish]
    
    @State private var isAlertShowing: Bool = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(wishes) {
                    wish in Text(wish.title)
                        .font(.title.weight(.light))
                        .padding (.vertical, 2)
                }
            }
            .navigationTitle("Wishlist")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing){
                    Button {
                        isAlertShowing.toggle()
                    } label: {
                        Image(systemName: "plus")
                            .imageScale(.large)
                    }
                }
            }
            .alert("Create a new wish", isPresented: $isAlertShowing){
                
            }
            .overlay {
                if wishes.isEmpty {
                    ContentUnavailableView(
                        "My Wishlist",
                        systemImage: "heart.circle",
                        description: Text("No wishes yet. Add on to your wishlist!")
                    )
                }
            }
        }
    }
}

#Preview("List with Sample Data"){
    let container = try! ModelContainer(for: Wish.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
    
    container.mainContext.insert(Wish(title: "Happiness 1/3"))
    container.mainContext.insert(Wish(title: "Happiness 2/3"))
    container.mainContext.insert(Wish(title: "Happiness 3/3"))

    return ContentView()
        .modelContainer(container)
}


#Preview("Empty List") {
    ContentView()
        .modelContainer(for: Wish.self, inMemory: true)
}
