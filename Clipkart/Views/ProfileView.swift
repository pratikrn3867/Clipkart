//
//  ProfileView.swift
//  Clipkart
//
//  Created by pratik.nalawade on 28/10/24.
//

import SwiftUI
import CoreData

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewModel()
    @Environment(\.managedObjectContext) private var viewContext
    
    var body: some View {
        TabView {
            List {
                Section {
                    HStack(spacing: 16) {
                        Text(viewModel.email.isEmpty ? "No Email" : viewModel.email)
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                            .frame(width: 70, height: 70)
                            .background(Color(.lightGray))
                            .clipShape(Circle())
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text(viewModel.email.isEmpty ? "No Email" : viewModel.email)
                                .font(.headline)
                                .fontWeight(.semibold)
                            
                            Text(viewModel.email.isEmpty ? "No Email" : viewModel.email)
                                .font(.footnote)
                        }
                    }
                }
        
                Button {
                    Task {
                        //       await authViewModel.deleteAccount()
                    }
                } label: {
                    Label {
                        Text("Delete Account")
                            .foregroundStyle(.black)
                    } icon: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundStyle(.red)
                    }
                }
            }
            .navigationTitle("Profile")
            .navigationBarBackButtonHidden(true)
            .tabItem {
                Image(systemName: "person.fill")
                Text("Profile")
            }
            
            // Settings Tab
            NavigationStack {
                SettingsView()
                    .navigationTitle("Settings")
                    .navigationBarBackButtonHidden(true)
            }
            .tabItem {
                Image(systemName: "gearshape.fill")
                Text("Settings")
            }
        }
        .onAppear {
            loadUserProfile() // Load user data when the view appears
        }

    }
    
    func loadUserProfile() {
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        // Debugging: Print the email being used in the fetch request
        print("Fetching user with email: \(viewModel.email)")
        
        fetchRequest.predicate = NSPredicate(format: "email == %@", viewModel.email)
        
        do {
            let users = try viewContext.fetch(fetchRequest)
            if let user = users.first {
                viewModel.email = user.email ?? "No Email"
                print("Fetched user email: \(viewModel.email)") // Print the fetched email
            } else {
                print("No user found with email: \(viewModel.email)")
            }
        } catch {
            print("Failed to fetch users: \(error.localizedDescription)")
        }
    }
}


#Preview {
    ProfileView()
}
