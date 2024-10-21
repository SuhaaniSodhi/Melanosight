//
//  Resources.swift
//  Melanosight
//
//  Created by Suhaani Sodhi on 9/21/24.
//

import SwiftUI

struct Resources: View {
    @State private var Risk = ""
    @State private var Types = ""
    @State private var Symp = ""
    @State private var Treatments = ""
    
    var body: some View {
        
            NavigationStack{
                ZStack{
                    Image("beige")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                    ScrollView{
                        VStack{
                            Text("Information and \n Resources!")
                                .font(.largeTitle)
                                .foregroundColor(Color(red: 0.7, green: 0.4, blue: 0.8))
                                .multilineTextAlignment(.center)
                                .padding(.bottom)
                            Text("Click on any of the buttons below to find out more about melanoma")
                                .foregroundColor(Color(red: 0.272, green: 0.022, blue: 0.181))
                                .multilineTextAlignment(.center)
                                .frame(width: 400.0)
                            HStack {
                                Button("Risk factors"){
                                    Risk = " • Exposure to ultraviolet (UV) radiation from the sun or tanning beds. \n • Having fair skin, light-colored eyes, or light-colored hair. \n • A history of sunburns or blistering sunburns, especially in childhood. \n • Family history of melanoma or genetic predisposition."

                                }
                                .buttonStyle(.borderedProminent)
                                .tint(Color(red: 0.897, green: 0.644, blue: 0.796))
                                .foregroundColor(Color(red: 0.271, green: 0.022, blue: 0.181))
                                .multilineTextAlignment(.leading)
                              
                            }
                            if !Risk.isEmpty {
                                HStack{
                                    Text(Risk)
                                    .font(.subheadline).multilineTextAlignment(.leading).frame(width: 385.0)
                                    .foregroundColor(Color(red: 0.271, green: 0.022, blue: 0.181))
                                }
                            }
                            HStack {
                                Button("Types of Melanoma"){
                                    Types = " • Superficial spreading melanoma: The most common type, often characterized by irregular borders and varying colors. \n • Nodular melanoma: Usually appears as a raised bump and grows more rapidly than other types. \n • Lentigo maligna melanoma: Typically occurs in older individuals and develops from long-term sun exposure. \n • Acral lentiginous melanoma: Appears on the palms, soles of the feet, or under the nails and is less associated with sun exposure."
                                }
                                .buttonStyle(.borderedProminent)
                                .tint(Color(red: 0.897, green: 0.644, blue: 0.796))
                                .foregroundColor(Color(red: 0.272, green: 0.022, blue: 0.181))
                                .multilineTextAlignment(.leading)
                              
                            }
                            if !Types.isEmpty {
                                HStack{
                                    Text(Types).font(.subheadline) .multilineTextAlignment(.leading).frame(width: 385.0)
                                        .foregroundColor(Color(red: 0.271, green: 0.022, blue: 0.181))
                                }
                            }
                            HStack {
                                Button("Symptoms"){
                                    Symp = "The 5 have an easy pneumonic to remember them. ABCDE! \n • Asymmetrical shape \n • Irregular or ragged borders  \n • Varied colors within the mole \n • Diameter larger than a pencil eraser \n • Evolution or changes in size, shape, or color over time \n "
                                }
                                .buttonStyle(.borderedProminent)
                                .tint(Color(red: 0.897, green: 0.644, blue: 0.796))
                                .foregroundColor(Color(red: 0.272, green: 0.022, blue: 0.181))
                                .multilineTextAlignment(.leading)
                              
                            }
                            if !Symp.isEmpty {
                                HStack{
                                    Text(Symp).font(.subheadline) .multilineTextAlignment(.leading).frame(width: 385.0)
                                        .foregroundColor(Color(red: 0.271, green: 0.022, blue: 0.181))
                                }
                            }
                            HStack {
                                Button("Possible Treatments"){
                                    Treatments = "• Surgery to remove the melanoma and a margin of healthy tissue. \n • Immunotherapy, which boosts the body's immune system to fight cancer cells. \n • Targeted therapy, which targets specific genetic mutations in cancer cells. \n • Radiation therapy, which uses high-energy beams to kill cancer cells. • Chemotherapy, although less commonly used for melanoma than other cancers."
                                }
                                .buttonStyle(.borderedProminent)
                                .tint(Color(red: 0.897, green: 0.644, blue: 0.796))
                                .foregroundColor(Color(red: 0.272, green: 0.022, blue: 0.181))
                                .multilineTextAlignment(.leading)
                              
                            }
                            if !Treatments.isEmpty {
                                HStack{
                                    Text(Treatments).font(.subheadline) .multilineTextAlignment(.leading).frame(width: 385.0)
                                        .foregroundColor(Color(red: 0.271, green: 0.022, blue: 0.181))
                                }
                            }
                        }
                        HStack{
                            NavigationLink (destination: Classifier().navigationBarBackButtonHidden(true)){
                                Text("Classifier")
                                    .font(.title3)
                                    .foregroundColor(Color(red: 0.494, green: 0.02, blue: 0.371))
                                    .multilineTextAlignment(.center)
                            }
                            NavigationLink (destination: About().navigationBarBackButtonHidden(true)){
                                Text("About Us")
                                    .font(.title3)
                                    .foregroundColor(Color(red: 0.494, green: 0.02, blue: 0.371))
                                    .multilineTextAlignment(.center)
                            }
                            NavigationLink (destination: ContentView().navigationBarBackButtonHidden(true)){
                                Text("Home")
                                    .font(.title3)
                                    .foregroundColor(Color(red: 0.494, green: 0.02, blue: 0.371))
                                .multilineTextAlignment(.center)                        }
                        }
                    }
                }
            }
        }
}

#Preview {
    Resources()
}
