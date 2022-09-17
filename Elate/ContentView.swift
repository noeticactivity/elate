//
//  ContentView.swift
//  Testapp
//
//  Created by Cairocoders
//
 
import SwiftUI
 
let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)
 
struct ContentView: View {
     
    @State var username: String = ""
    @State var password: String = ""
     
    @State var authenticationDidFail: Bool = false
     
    var body: some View {
        NavigationView {
            VStack {
                Text("Welcome!")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .padding(.bottom, 20)
                 
//                Image("login")
//                    .resizable()
//                    .aspectRatio(contentMode: .fill)
//                    .frame(width: 150, height: 150)
//                    .clipped()
//                    .cornerRadius(150)
//                    .padding(.bottom, 75)
                 
                TextField("Username", text: $username)
                    .padding()
                    .background(lightGreyColor)
                    .cornerRadius(5.0)
                    .padding(.bottom, 20)
                    .shadow(radius: 5)
                 
                SecureField("Password", text: $password)
                    .padding()
                    .background(lightGreyColor)
                    .cornerRadius(5.0)
                    .padding(.bottom, 20)
                    .shadow(radius: 5)
                 
                Button(action: {}) {
                    Text("LOGIN")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 220, height: 60)
                        .background(Color.green)
                        .cornerRadius(15.0)
                        .shadow(radius: 5)
                        //.border(Color.red, width: 4)
                }
                 
               VStack {
                    Text("Create Account")
                    NavigationLink(destination: ContentViewregister()) {
                        Text("Register")
                    }
                }
               .padding()
            }
            .padding()
        }
    }
         
}
 
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentViewregister()
        }
    }
}
 
struct Location {
    static let allLocations = [
        "New York",
        "London",
        "Tokyo",
        "Berlin",
        "Olongapo",
        "Paris"
    ]
}
struct ContentViewregister : View {
     
    @State private var firstname = ""
    @State private var lastname = ""
    @State private var location = ""
    @State private var termsAccepted = false
    @State private var age = 20
    @State private var profileImage: Image = Image("userAvatar1")
    @State private var isShowingDetailView: Bool = false
    @State private var isPresented = false


 
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("")) {
                    profileImage
                        .resizable()
                        .frame(width: 150, height: 150)
                    TextField("First Name",
                              text: $firstname)
                    TextField("Last Name",
                              text: $lastname)
                    Picker(selection: $location,
                           label: Text("Location")) {
                            ForEach(Location.allLocations, id: \.self) { location in
                                Text(location).tag(location)
                            }
                    }
                     
                    Toggle(isOn: $termsAccepted,
                           label: {
                            Text("Accept terms and conditions")
                    })
                     
                    Stepper(value: $age,
                            in: 18...100,
                            label: {
                        Text("Current age: \(self.age)")
                    })
                    Button(action: {
                        self.isPresented.toggle()
                    }) {
                        Text("Register")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 220, height: 60)
                            .background(Color.green)
                            .cornerRadius(15.0)
                            .shadow(radius: 5)
                            //.border(Color.red, width: 4)
                    }
                    .padding()
                    .fullScreenCover(isPresented: $isPresented, content: MainView.init)
                }
                .frame(maxWidth: .infinity, alignment: .center)

            }
            .navigationBarTitle(Text("Register"))
        }
    }
}
