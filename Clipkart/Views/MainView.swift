//
//  MainView.swift
//  Clipkart
//
//  Created by pratik.nalawade on 25/10/24.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = ProductViewModel()
    @State private var isMenuOpen = false
    
    var body: some View {
        ZStack {
            TabView {
                // Home Tab
                NavigationStack {
                    List {
                        ForEach(Array(viewModel.products.enumerated()), id: \.element.id) { index, product in
                            if NetworkMonitor.shared.netOn {
                                NavigationLink {
                                    ProductDetailsView(products: viewModel.products, index: index)
                                        .navigationBarBackButtonHidden(true)
                                } label: {
                                    ProductRowView(product: product)
                                }
                            }
                        }
                    }
                    .listStyle(.plain)
                    .navigationTitle("Products")
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarBackButtonHidden(true)
                    .navigationBarItems(leading: Button(action: {
                        isMenuOpen.toggle()
                    }) {
                        Image(systemName: "line.horizontal.3")
                            .font(.title)
                    })
                    .alert("net chalu kr bhadya", isPresented: $viewModel.isNetClosed) {}
                }
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
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
                
                // Profile Tab
                NavigationStack {
                    ProfileView()
                        .navigationTitle("Profile")
                        .navigationBarBackButtonHidden(true)
                }
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
            }
            // Side menu
            if isMenuOpen {
                SideMenu(isMenuOpen: $isMenuOpen)
                    .transition(.move(edge: .leading))
                    .offset(x: -50) // Adjust this value to move the menu further left
            }
        }
        .animation(.easeInOut, value: isMenuOpen)
        .task {
            await viewModel.fetchProducts()
        }
    }
}

#Preview {
    MainView()
}

struct SideMenu: View {
    @Binding var isMenuOpen: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            Button(action: {
                // Handle Settings action
                isMenuOpen = false // Close menu after selection
            }) {
                Text("My Wishlist")
                    .font(.headline) // Change font size
                    .foregroundColor(.white) // Text color
                    .padding() // Internal padding
                    .background(Color.black) // Background color
                    .cornerRadius(120) // Rounded corners
            }
            .padding() // Outer padding to separate from other views
            .frame(maxWidth: .infinity, alignment: .leading) // Align to the leading edge
            
            Button(action: {
                // Handle Settings action
                isMenuOpen = false // Close menu after selection
            }) {
                Text("My Rewards")
                    .font(.headline) // Change font size
                    .foregroundColor(.white) // Text color
                    .padding() // Internal padding
                    .background(Color.black) // Background color
                    .cornerRadius(120) // Rounded corners
            }
            .padding() // Outer padding to separate from other views
            .frame(maxWidth: .infinity, alignment: .leading) // Align to the leading edge
            
            Button(action: {
                // Handle Settings action
                isMenuOpen = false // Close menu after selection
            }) {
                Text("Sell on clipkart")
                    .font(.headline) // Change font size
                    .foregroundColor(.white) // Text color
                    .padding() // Internal padding
                    .background(Color.black) // Background color
                    .cornerRadius(120) // Rounded corners
            }
            .padding() // Outer padding to separate from other views
            .frame(maxWidth: .infinity, alignment: .leading) // Align to the leading edge
            
            Button(action: {
                // Handle Settings action
                isMenuOpen = false // Close menu after selection
            }) {
                Text("Feedback")
                    .font(.headline) // Change font size
                    .foregroundColor(.white) // Text color
                    .padding() // Internal padding
                    .background(Color.black) // Background color
                    .cornerRadius(120) // Rounded corners
            }
            .padding() // Outer padding to separate from other views
            .frame(maxWidth: .infinity, alignment: .leading) // Align to the leading edge
            
            Button(action: {
                // Handle Settings action
                isMenuOpen = false // Close menu after selection
            }) {
                Text("Help Bot")
                    .font(.headline) // Change font size
                    .foregroundColor(.white) // Text color
                    .padding() // Internal padding
                    .background(Color.black) // Background color
                    .cornerRadius(120) // Rounded corners
            }
            .padding() // Outer padding to separate from other views
            .frame(maxWidth: .infinity, alignment: .leading) // Align to the leading edge
            
            Button(action: {
                // Handle Settings action
                isMenuOpen = false // Close menu after selection
            }) {
                Text("Log Out")
                    .font(.headline) // Change font size
                    .foregroundColor(.white) // Text color
                    .padding() // Internal padding
                    .background(Color.black) // Background color
                    .cornerRadius(120) // Rounded corners
            }
            .padding() // Outer padding to separate from other views
            .frame(maxWidth: .infinity, alignment: .leading) // Align to the leading edge
            Spacer()
        }
        .frame(width: 290)
        .background(Color.gray.opacity(0.9))
        .cornerRadius(185) // Optional: add corner radius for a softer look
        .edgesIgnoringSafeArea(.vertical)
        .onTapGesture {
            isMenuOpen = false // Close menu on tap outside
        }
    }
}


//To check/test localization

//struct ContentViews: View {
//    @State private var email:String = ""
//    var body: some View {
//        VStack {
//            Text("Email and Phone number!")
//                .font(.headline)
//                .padding()
//
//            Text("Unknown user!")
//                .foregroundColor(.red)
//                .padding()
//
//            Button(action: {
//                print(NSLocalizedString("User saved!", comment: ""))
//            }) {
//                Text("User saved!")
//            }
//            .padding()
//
//            Text("Please fill some detail!")
//                .padding()
//
//            Text("Please fill user!")
//                .padding()
//            InputView(
//                placeholder: "Email and Phone number!",
//                text: $email
//            )
//        }
//        .padding()
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentViews()
//    }
//}
