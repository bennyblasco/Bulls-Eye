//
//  ContentView.swift
//  BullsEye
//
//  Created by Benjamin Inemugha on 04/06/2020.
//  Copyright © 2020 Techelopers. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var alertIsVisible: Bool = false
    @State var sliderValue: Double = 50.0
    
    var body: some View{
        VStack{
            Spacer()
            //Target row
            HStack {
                Text("Slide as close as you can to:")
                Text("100")
                    
            }
            Spacer()
            //Slider row
            
            HStack{
                Text("1")
                Slider(value: self.$sliderValue, in: 1...100)
                Text("100")
            }
            Spacer()
            
            //Button row
            Button(action:{
                print("Button pressed!")
                self.alertIsVisible = true
            }){
                Text("Hit me!")
            }
                Spacer()
            
            .alert(isPresented: $alertIsVisible) { () -> Alert in
                return Alert(title: Text("Hello there!"), message: Text("Slider value is \(self.sliderValue)"), dismissButton: .default(Text("Awesome!")))
            
                }
            Spacer()
            //Score row
            HStack{
                Button(action: {}) {
                    Text("Start Over")
                }
                Spacer()
                Text("Score:")
                Text("999999")
                Spacer()
                Text("Round:")
                Text("999")
                Spacer()
                Button(action: {}) {
                    Text("Info")
                }
            }
            .padding(.bottom, 20)
            
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 896, height: 414))
    }
}
