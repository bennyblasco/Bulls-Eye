//  Github
//  Commit
//  AboutView.swift
//  BullsEye
//
//  Created by Benjamin Inemugha on 12/06/2020.
//  Copyright © 2020 Techelopers. All rights reserved.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        VStack{
        Spacer()
            Text("🎯Bulls Eye 🎯\n")
                .fontWeight(.bold)
                .foregroundColor(Color.white)
        Text("Bulls Eye is a game where you win points by being precise with sliding to the random number")
        .foregroundColor(Color.white)
        Text("Hit to check your score")
        .foregroundColor(Color.white)
        Text("The more precise your are, the more score you get")
        .foregroundColor(Color.white)
        Text("Enjoy!")
        .foregroundColor(Color.white)
        Spacer()
        Text("Created Benjamin Inemugha")
        .foregroundColor(Color.white)
        }
        .navigationBarTitle("About Bulls Eye")
        .background(Image("Background"), alignment: .center)
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView().previewLayout(.fixed(width: 896, height: 414))
    }
}
