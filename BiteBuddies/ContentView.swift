import SwiftUI
import AVFoundation

@main
struct BiteBuddiesApp: App {
    @State var isLoggedIn = false
    
    var body: some Scene {
        WindowGroup {
            ContentView(isLoggedIn: $isLoggedIn)
        }
    }
}

struct ContentView: View {
    @Binding var isLoggedIn: Int
    
    
    var body: some View {
        if isLoggedIn {
            LoggedInView()
        } else{
            LoginView(isLoggedIn: $isLoggedIn)
        }
    }
}
struct PreviewScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoggedInView()
    }
}
struct Dish: Identifiable {
    var id = UUID()
    var name: String
    var creator: String
}

struct User: Identifiable {
    var id = UUID()
    var name: String
}

struct LoggedInView: View {
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.white)
                    .padding()
                Text("Cooking Together")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding()
                Spacer()
                Image(systemName: "camera.fill")
                    .resizable()
                    .frame(width: 25, height: 30)
                    .foregroundColor(.white)
                    .padding()
                    .onTapGesture {
                        camerahit=true;
                    }
            }
            
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(0..<5) { index in
                        HStack {
                            Image(systemName: "person.fill")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .foregroundColor(.white)
                                .padding()
                            VStack(alignment: .leading) {
                                Text("Cooking Event \(index)")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
                                    .font(.body)
                                    .foregroundColor(.white)
                            }
                            Spacer()
                            Button(action: {
                                print("Join Event \(index) tapped")
                            }) {
                                Text("Join")
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 10)
                                    .padding(.vertical, 5)
                                    .background(Color.blue)
                                    .cornerRadius(10)
                            }
                            .padding(.trailing, 10)
                        }
                        .frame(maxWidth: .infinity)
                        .background(Color(red: 30/255, green: 30/255, blue: 30/255))
                        .cornerRadius(10)
                    }
                }
                .padding(.horizontal)
                .padding(.bottom, 20)
            }
            

        }
        .background(Color.black.ignoresSafeArea())
        .navigationBarItems(trailing:
            Button(action: {
               
            }) {
                Image(systemName: "camera.fill")
                    .resizable()
                    .frame(width: 25, height: 20)
                    .foregroundColor(.white)
                    .padding()
            })
    }
}


struct DishDetailView: View {
    var dish: Dish
    var user: User
    
    var body: some View {
        VStack {
            Text(dish.name)
                .font(.title)
            Text("Created by: \(dish.creator)")
                .font(.subheadline)
            Divider()
            Text("Participating Users:")
                .font(.headline)
            Text(user.name)
                .font(.subheadline)
                .foregroundColor(.blue)
            Divider()
            Button("Join Dish") {
                // Add user to participating users for this dish
            }
        }
        .padding()
        .navigationTitle(dish.name)
    }
}


struct LoginView: View {
    // MARK: Properties
    @State private var username = ""
    @State private var password = ""
    @Binding var isLoggedIn: Bool
    
    // MARK: View Body
    var body: some View {
        VStack {
            Color.black.ignoresSafeArea()
            Image(systemName: "carrot.fill")
                .foregroundColor(Color.orange)
            Text("BiteBuddies")
                .font(Font.custom("Times", size: 40))
                .padding(.bottom, 50)
                .foregroundColor(Color.white)
            VStack(alignment: .leading) {
                Text("Username")
                TextField("Enter your username", text: $username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.bottom, 20)
                Text("Password")
                SecureField("Enter your password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .padding(.bottom, 50)
            Button("Login") {
                if username == "user" && password == "password" {
                    isLoggedIn = true
                }
            }
            .frame(width: 200, height: 50)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .padding()
        .background(Color.black)
    }
}
