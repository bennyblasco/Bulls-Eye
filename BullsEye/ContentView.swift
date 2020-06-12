//
//  ContentView.swift
//  BullsEye
//
//  Created by Benjamin Inemugha on 04/06/2020.
//  Copyright © 2020 Techelopers. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var alertIsVisible = false
    @State var sliderValue = 50.0
    @State var target = Int.random(in: 1...100)
    @State var score = 0
    @State var round = 1
    
    let modifiedaccentColor = Color(red: 0.5/255, green: 51.0/255, blue: 102.0/255)
    
    struct LabelStyle: ViewModifier {
        func body(content: Content) -> some View {
            content
            .foregroundColor(Color.white)
            .modifier(Shadow())
            .font(Font.custom("Arial Rounded MT Bold", size: 18))
        }
    }
    struct ValueStyle: ViewModifier{
        func body(content: Content) -> some View {
            content
            .foregroundColor(Color.yellow)
            .modifier(Shadow())
            .font(Font.custom("Arial Rounded MT Bold", size: 24))
        }
    }
    struct Shadow: ViewModifier{
        func body(content: Content) -> some View {
            content
            .shadow(color: Color.black, radius: 5, x: 2, y: 2 )
        }
    }
    struct ButtonLarge: ViewModifier{
        func body(content: Content) -> some View {
            content
            .foregroundColor(Color.black)
            .font(Font.custom("Arial Rounded MT Bold", size: 20))
        }
    }
    
    struct ButtonSmall: ViewModifier{
        func body(content: Content) -> some View {
            content
            .foregroundColor(Color.black)
            .font(Font.custom("Arial Rounded MT Bold", size: 12))
        }
    }
    var body: some View{
        VStack{
            Spacer()
            //Target row
            HStack {
                Text("Slide as close as you can to:").modifier(LabelStyle())
                Text("\(self.target)").modifier(ValueStyle())
            }
            Spacer()
            //Slider row
            
            HStack{
                Text("1").modifier(LabelStyle())
                Slider(value: self.$sliderValue, in: 1...100).accentColor(Color.red)
                Text("100").modifier(LabelStyle())
            }
            Spacer()
            
            //Button row
            Button(action:{
                //print("Button pressed!")
                self.alertIsVisible = true
                //self.score = self.score + self.pointsForCurrentRound()
            }){
                Text("Hit me!").modifier(ButtonLarge())
                
            }
            .background(Image("Button")).modifier(Shadow())
            Spacer()
                
                .alert(isPresented: $alertIsVisible) { () -> Alert in
                    //let roundedValue = Int(self.sliderValue.rounded())
                    return Alert(title: Text("\(alertTitle())"), message: Text("Slider value is \(sliderValueRounded()).\n" + "You scored \(self.pointsForCurrentRound()) points this round."), dismissButton: .default(Text("Awesome!")){
                        self.score = self.score + self.pointsForCurrentRound()
                        self.target = Int.random(in: 1...100)
                        self.round = self.round + 1
                        })
                    
            }
            
            Spacer()
            //Score row
            HStack{
                Button(action: {
                    self.startNewGame()
                }) {
                    HStack{
                        Image("StartOverIcon")
                        Text("Start Over").modifier(ButtonSmall())
                    }
                }
                .background(Image("Button")).modifier(Shadow())
                Spacer()
                Text("Score:").modifier(LabelStyle())
                Text("\(score)").modifier(ValueStyle())

                Spacer()
                Text("Round:").modifier(LabelStyle())
                Text("\(round)").modifier(ValueStyle())

                Spacer()
                Button(action: {}) {
                    HStack{
                        Image("InfoIcon")
                        Text("Info").modifier(ButtonSmall())
                    }
                }
                .background(Image("Button")).modifier(Shadow())
            }
            .padding(.bottom, 20)
        }
        .background(Image("Background"), alignment: .center)
        .accentColor(modifiedaccentColor)
    }
    
    func sliderValueRounded() -> Int{
        Int(self.sliderValue.rounded())
    }
    
    func amountOff() -> Int{
        abs(self.target - sliderValueRounded())
    }
    
    func pointsForCurrentRound() -> Int{
        
        let maximumScore = 100
        let difference = amountOff()
        let bonus: Int
        if difference == 0 {
            bonus = 100
        }else{
            bonus = 0
        }
        return maximumScore - difference + bonus
    }
    
    func alertTitle() -> String{
        let difference = amountOff()
        let title: String
        if difference == 0{
            title = "Perfect"
        }else if difference < 5 {
            title = "You almost had it!"
            
        }else if difference <= 10 {
            title = "Not bad"
        }else if difference <= 15 {
            title = "Poor"
        }else{
            title = "Are you even trying?"
        }
        return title
    }
    func startNewGame() {
        round = 1
        score = 0
        sliderValue = 50.0
        target = Int.random(in: 1...100)
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView().previewLayout(.fixed(width: 896, height: 414))
        }
    }
}
