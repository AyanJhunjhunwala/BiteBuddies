import SwiftUI
import AVFoundation

@main
struct BiteBuddiesApp: App {
    @State var isLoggedIn = false
    @State private var showDetails = false

    var body: some Scene {
        WindowGroup {
            ContentView(isLoggedIn: $isLoggedIn)
        }
    }
}

struct ContentView: View {
    @Binding var isLoggedIn: Bool
    var body: some View {
        if isLoggedIn {
            LoggedInView().matchedGeometryEffect(id:"details" ,in: namespace)
        } else{
            LoginView(isLoggedIn: $isLoggedIn).matchedGeometryEffect(id: "summary",in: namespace)
        }
    }
    private let namespace = Namespace().wrappedValue
    
}
struct PreviewScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoggedInView()
    }
}
struct SummaryView: View {
    var body: some View {
        VStack {
            Text("Summary View")
                .font(.title)
                .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.blue)
    }
}

struct DetailsView: View {
    var body: some View {
        VStack {
            Text("Details View")
                .font(.title)
                .padding()
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.green)
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
    @State private var foodImage: UIImage?
    
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
                        // Add functionality for camera button
                    }
            }
            .padding(.horizontal)
            .padding(.top, 20)
            
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(0..<5) { index in
                        HStack {
                            
                            Image("FoodImgs")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .foregroundColor(.white)
                                .padding()
                            VStack(alignment: .leading) {
                                Text("Cooking Event \(index)")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                Text("Join us for a fun evening of cooking and socializing with other foodies in the area! All skill levels welcome. Please let us know if you have any dietary restrictions or preferences.")
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
                        .background(Color(red: 50/255, green: 50/255, blue: 50/255))
                        .cornerRadius(10)
                    }
                }
                .padding(.horizontal)
                .padding(.bottom, 20)
            }
            
            if let foodImage = foodImage {
                Image(uiImage: foodImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 200)
                    .padding(.horizontal)
            }
        }
        .background(Color(red: 80/255, green: 80/255, blue: 80/255).ignoresSafeArea())
        .navigationBarItems(trailing:
                                Button(action: {
            // Add functionality for camera button
        }) {
            Image(systemName: "camera.fill")
                .resizable()
                .frame(width: 25, height: 20)
                .foregroundColor(.white)
                .padding()
        })
        
        
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

